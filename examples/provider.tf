terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.0.0" # Refer to docs for latest version
    }
  }
  # cloud {
  #   organization = "terraform-org-name"
  #   workspaces {
  #     tags = ["component:auth0"]
  #   }
  # }
}

provider "auth0" {
  domain        = "*********"
  client_id     = "*********"
  client_secret = "*********"
}
