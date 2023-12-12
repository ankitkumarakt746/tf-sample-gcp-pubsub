terraform {
  required_version = "~> 1.2.5"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
  }
  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-pubsub/v4.0.1"
  }
}