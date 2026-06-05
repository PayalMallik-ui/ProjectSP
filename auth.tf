variable "sailpoint_client_id" {
  description = "SailPoint ISC OAuth 2.0 Client ID"
  type        = string
  sensitive   = true
}

variable "sailpoint_client_secret" {
  description = "SailPoint ISC OAuth 2.0 Client Secret"
  type        = string
  sensitive   = true
}

variable "sailpoint_tenant_url" {
  description = "SailPoint ISC Tenant URL"
  type        = string
}
