terraform {
  required_version = ">= 1.0"

  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

provider "http" {
  # HTTP provider configuration
  # Used for making HTTP requests to SailPoint ISC API endpoints
}
