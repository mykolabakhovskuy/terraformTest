resource "google_compute_instance" "default" {
  count        = "${var.count}"
  name         = "${var.name}-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  tags = ["test"]
  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }
  scratch_disk {
  }
 metadata {
    ssh-keys = "mykola:${file("~/.ssh/id_rsa.pub")}"
}
# metadata_startup_script = "${file($vars.path)}"

  network_interface {
    network = "${var.network}"

    access_config {
      // Ephemeral IP
    }
  

}
}
output "instances"{
  value = "var.name"
}
