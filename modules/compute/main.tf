resource "google_compute_instance" "default" {
  count        = "2"
  name         = "test-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }
  scratch_disk {
  }
 metadata {
    ssh-keys = "mykola:${file("~/.ssh/id_rsa.pub")}"
}
 metadata_startup_script = "sudo apt install -y nginx && sudo systemctl restart nginx"

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  

}
}
resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

}


