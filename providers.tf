terraform {
  required_version = "~>1.1"
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.15"
    }
  }

}