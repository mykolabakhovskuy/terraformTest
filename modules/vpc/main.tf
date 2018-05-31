resource "google_compute_network" "test" {
 name                    = "${var.name}"
 auto_create_subnetworks = "true"
}
resource "google_compute_firewall" "test" {
  depends_on    = ["google_compute_network.test"]
  name    = "${var.namefirewall}"
  network = "${var.network}"

  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }

}

output "name" {
  value = "${google_compute_network.test.name}"
}
