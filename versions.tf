terraform {
  required_providers {
    civo = {
      source  = "civo/civo"
      version = ">= 1.1.3"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
  required_version = ">= 1.5.7"
}