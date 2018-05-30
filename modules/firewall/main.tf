resource "google_compute_firewall" "test" {
  name    = "${var.name}"
  network = "${var.network}"

  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }

}
