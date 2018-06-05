resource "google_compute_instance" "default" {
  count        = "${var.count}"
  name         = "${var.name}-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  tags = "${var.tags}"
  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }
 metadata {
    // Add ssh keys to compute engine account
    ssh-keys = "mykola:${file("${var.ssh}")}"
}
   // Startup scripts 
 metadata_startup_script = "${file("${var.path}")}"

  network_interface {
    network = "${var.network}"

    access_config {
      // Create External ip for instances 
      //Add External IP
    }
  }
}


