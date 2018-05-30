resource "google_compute_network" "test" {
 name                    = "test"
 auto_create_subnetworks = "true"
}



output "name" {
  value = "${var.name}"
}
