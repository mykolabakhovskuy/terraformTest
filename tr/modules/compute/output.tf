output "zones" {
// output zone for computed instances
    value = ["${google_compute_instance.default.*.zone}"]
}

output "url" {
// output url for computed instances
    value = ["${google_compute_instance.default.*.self_link}"]
}
