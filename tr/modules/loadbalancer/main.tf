resource "google_compute_forwarding_rule" "default" {
  project               = "${var.project}"
  name                  = "${var.name}"
  // target use link to google_compute_target_pool 
  target                = "${google_compute_target_pool.default.self_link}"
  // create External load balancer
  load_balancing_scheme = "EXTERNAL"
  port_range            = "${var.service_port}"
  region           = "${var.region}"
  
}

resource "google_compute_target_pool" "default" 
{
  //Creating  target pool for you instances
  name             = "${var.name}"
  project          = "${var.project}"
  region           = "${var.region}"
  instances = ["${var.instances}",]
  // Add health check to you target poll
  health_checks = [
    "${google_compute_http_health_check.default.name}",
  ]
}

resource "google_compute_http_health_check" "default" {
  // create health check
  project      = "${var.project}"
  name         = "${var.name}-hc"
  request_path = "/"
  port         = "${var.service_port}"
}

