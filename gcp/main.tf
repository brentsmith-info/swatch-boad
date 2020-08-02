provider "google" {
  credentials = file("/tmp/brentsmith-info-terraform-sa.json")
  project     = var.google_project
  region      = "us-east1"
}

resource "google_dns_record_set" "frontend" {
  name = "frontend.brentsmith.info."
  type = "A"
  ttl  = 300

  managed_zone = "brentsmith-info-zone"

  rrdatas = [google_compute_instance.frontend.network_interface[0].access_config[0].nat_ip]
}

resource "google_compute_instance" "frontend" {
  name         = "frontend"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

}
resource "google_compute_firewall" "default" {
  name    = "port-5000-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
}
