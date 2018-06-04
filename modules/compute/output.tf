output "zones" {
    value = ["${google_compute_instance.default.*.zone}"]
}

output "names" {
// output uri for computed instances
    value = ["${google_compute_instance.default.*.self_link}"]
}
