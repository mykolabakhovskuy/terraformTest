output "name" {
  value = "${google_compute_network.test.name}"
}
output "network1"{
  value = "${google_compute_network.test.self_link}"
}
