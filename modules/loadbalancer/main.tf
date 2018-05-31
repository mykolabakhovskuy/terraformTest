resource "google_compute_forwarding_rule" "default" {
  project               = "${var.project}"
  name                  = "${var.name}"
  target                = "${google_compute_target_pool.default.self_link}"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "${var.service_port}"
  region           = "${var.region}"
  
}

resource "google_compute_target_pool" "default" 
{
  name             = "${var.name}"
  project          = "${var.project}"
  region           = "${var.region}"
#instances         = ["${formatlist("%s/%s/%s", webserver-1, )}"]
instances = [
    "europe-west1-b/webserver-1",
    "europe-west1-b/webserver-0",
  ]
  health_checks = [
    "${google_compute_http_health_check.default.name}",
  ]
}

resource "google_compute_http_health_check" "default" {
  project      = "${var.project}"
  name         = "${var.name}-hc"
  request_path = "/"
  port         = "${var.service_port}"
}

