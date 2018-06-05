resource "google_compute_network" "test" {
  // create vpc network
 name                    = "${var.name}"
 // use auto creation for subnetwork
 auto_create_subnetworks = "true"
}

// create firewall rules
resource "google_compute_firewall" "test" {
  // creating after google_compute_network
  depends_on    = ["google_compute_network.test"] 
  name    = "${var.namefirewall}"
  network = "${google_compute_network.test.name}"

// Allow properties for firewall 
  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }
}
