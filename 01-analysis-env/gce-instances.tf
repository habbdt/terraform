# bad practice
data "google_service_account" "default-compute-engine-sa" {
  account_id = "projects/encryptiun-devel/serviceAccounts/105000745860745302822"
  project = var.gcp_project
}

resource "google_compute_instance" "gce-instance" {
  name         = var.gce_instance_01
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.gcp_project 

  tags = ["unbreakable", "linux-oracle-lol"]

  boot_disk {
    initialize_params {
      image = var.image_family
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = (var.startup_script == null) ? null : (fileexists(var.startup_script) ? file(var.startup_script) : var.startup_script)

#   service_account {
#     email  = google_service_account.default-compute-engine-sa.account_id
#     scopes = ["cloud-platform"]
#   }
}