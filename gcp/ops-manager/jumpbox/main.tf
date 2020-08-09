provider "google" {
  credentials = file("/tmp/brentsmith-info-terraform-sa.json")
  project     = "brentsmith-info"
  region      = "us-east1"
}

resource "google_compute_instance" "tkgi-jumpbox" {
  name         = "tkgi-jumpbox"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size  = 25
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = <<-EOF
    sudo apt update
    sudo apt install -yq apt-transport-https ca-certificates curl gnupg2 software-properties-common git sshfs jq
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -yq ansible 
  EOF
}

