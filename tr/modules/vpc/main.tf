resource "google_compute_network" "test" {
  // create vpc network, with auto creation subnetworks.
 name                    = "${var.name}"
 auto_create_subnetworks = "true"
}

// create firewall rules
resource "google_compute_firewall" "test" {
// This resource start only when google_compute_network creates
  depends_on    = ["google_compute_network.test"] 
  name          = "${var.namefirewall}"
  network       = "${google_compute_network.test.name}"
// Allow properties for firewall 
  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }
}
