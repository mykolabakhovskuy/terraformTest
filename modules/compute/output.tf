output "zones" {
    value = ["${google_compute_instance.default.*.zone}"]
}

output "names" {
    value = ["${google_compute_instance.default.*.self_link}"