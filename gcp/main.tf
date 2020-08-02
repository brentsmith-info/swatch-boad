provider "google" {
  credentials = file("/tmp/brentsmith-info-terraform-sa.json")
  project     = var.google_project
  region      = "us-east1"
}

resource "google_dns_record_set" "frontend" {
  name = "frontend.${google_dns_managed_zone.brentsmith-info-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.brentsmith-info-zone.name

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
