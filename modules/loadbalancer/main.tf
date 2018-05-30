resource "google_compute_forwarding_rule" "default" {
  project               = "${var.project}"
  name                  = "${var.name}"
  target                = "${google_compute_target_pool.default.self_link}"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
}
resource "google_compute_target_pool" "default" {
  project          = "${var.project-name}"
  name             = "${var.name}"
  region           = "${var.region}"

  health_checks = [
    "${google_compute_http_health_check.default.name}",
  ]
}
resource "google_compute_http_health_check" "default" {
  project      = "${var.project-name}"
  name         = "${var.name}-hc"
  request_path = "/"
  port         = "${var.port}"
}
