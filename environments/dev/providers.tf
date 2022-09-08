terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.35.0"
    }
  }
}

  provider "google" {
    # Configuration options
    project = "tf-sample-361709"
    credentials = "keys.json"
  }