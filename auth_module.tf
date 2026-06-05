locals {
  sailpoint_auth = {
    tenant_url     = var.sailpoint_tenant_url
    client_id      = var.sailpoint_client_id
    client_secret  = var.sailpoint_client_secret
    base_url       = "${var.sailpoint_tenant_url}/api/v3"
  }
}

# Data source to get OAuth 2.0 access token from SailPoint ISC
data "http" "sailpoint_token" {
  url    = "${var.sailpoint_tenant_url}/oauth/token"
  method = "POST"

  request_headers = {
    "Content-Type" = "application/x-www-form-urlencoded"
  }

  request_body = "grant_type=client_credentials&client_id=${var.sailpoint_client_id}&client_secret=${var.sailpoint_client_secret}"
}

locals {
  token_response = jsondecode(data.http.sailpoint_token.response_body)
  access_token   = local.token_response.access_token
  token_type     = local.token_response.token_type

  sailpoint_headers = {
    "Authorization" = "${local.token_type} ${local.access_token}"
    "Content-Type"  = "application/json"
    "Accept"        = "application/json"
  }
}

output "sailpoint_auth_headers" {
  description = "HTTP headers with authorization token for SailPoint ISC API calls"
  value       = local.sailpoint_headers
  sensitive   = true
}

output "sailpoint_base_url" {
  description = "SailPoint ISC API base URL"
  value       = local.sailpoint_auth.base_url
}
