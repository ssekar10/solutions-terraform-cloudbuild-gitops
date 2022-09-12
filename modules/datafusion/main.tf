resource "google_data_fusion_instance" "first_instance" {
  name = "my-instance"
  description = "My Data Fusion instance"
  region = "us-central1"
  type = "BASIC"
  enable_stackdriver_logging = false
  enable_stackdriver_monitoring = false
  labels = {
    example_key = "example_value"
  }
  private_instance = true
  network_config {
    network = "default"
    ip_allocation = "10.89.48.0/22"
  }
}
  
 /*  version = "6.3.0"
  #dataproc_service_account = data.google_app_engine_default_service_account.default.email
  # Mark for testing to avoid service networking connection usage that is not cleaned up
  #options = {
    prober_test_run = "true"
  }
}

data "google_app_engine_default_service_account" "default" {
} */