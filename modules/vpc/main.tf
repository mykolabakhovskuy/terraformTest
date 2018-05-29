data "google_compute_network" "default" {
  name                    = "testvpc"
  auto_create_subnetworks = "true"
}

data "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

}

