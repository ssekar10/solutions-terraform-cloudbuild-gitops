# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


 
  resource "google_compute_instance" "vm-from-tf1" {
  name = "vm-from-tf1"
  zone = "us-west4-b"
  machine_type = "n1-standard-2"

  allow_stopping_for_update = true

  network_interface {
    network = "default"
    subnetwork = "default"
    access_config {
      }
  }

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20220822"
      size = 30
      
    }
    auto_delete = false
  }

  labels = {
    "env" = "tfleaning"
  }

  
  scheduling {
    preemptible = false
    automatic_restart = false
  }
  
  service_account {
    email = "865326266306-compute@developer.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }

}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = "us-west4-b"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf1.id
}


