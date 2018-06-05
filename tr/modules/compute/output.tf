output "zones" {
// output zone from computed instances
    value = ["${google_compute_instance.default.*.zone}"]
}

output "url" {
// output url from computed instances
    value = ["${google_compute_instance.default.*.self_link}"]
}
