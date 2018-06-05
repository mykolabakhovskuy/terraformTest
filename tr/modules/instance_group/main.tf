resource "google_compute_instance_group" "default" {
  name        = "${var.name}"
  description = "Terraform test instance group"
  zone        = "${var.zone}"
  network     = "${var.network}"
  instances   = ["${var.instances}",]
}
