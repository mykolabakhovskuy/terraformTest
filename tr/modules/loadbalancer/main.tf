resource "google_compute_forwarding_rule" "default" {
  // create External load balancer
  project               = "${var.project}"
  name                  = "${var.name}"
  // target use link to google_compute_target_pool 
  target                = "${google_compute_target_pool.default.self_link}"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "${var.service_port}"
  region                = "${var.region}"
  
}

resource "google_compute_target_pool" "default" 
{
  //Creating  target pool for you instances
  name          = "${var.name}"
  project       = "${var.project}"
  region        = "${var.region}"
  // add instances and health_checks to instances target pool
  instances     = ["${var.instances}",]
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

