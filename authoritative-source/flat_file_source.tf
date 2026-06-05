resource "http" "create_flat_file_source" {
  url    = "${local.sailpoint_auth.base_url}/sources"
  method = "POST"

  request_headers = local.sailpoint_headers

  request_body = jsonencode({
    name        = "My Flat File Source"
    description = "Flat file source created via Terraform"
    owner = {
      type = "IDENTITY"
      id   = var.owner_identity_id
      name = var.owner_identity_name
    }
    connectorClass = "sailpoint.connector.DelimitedFileConnector"
    connectorName  = "Delimited File"
    connectionType = "file"
  })
}
