# variables.tf
variable "owner_identity_id" {
  description = "Identity ID of the source owner"
  type        = string
}

variable "owner_identity_name" {
  description = "Display name of the source owner"
  type        = string
}
