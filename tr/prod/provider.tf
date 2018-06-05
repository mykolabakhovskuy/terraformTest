provider "google" {
  credentials = "${file("${var.credential}")}"
  region  = "${var.region}"
  project = "${var.project-name}"
}

