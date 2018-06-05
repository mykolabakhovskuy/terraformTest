output "name" {
// name for network
  value = "${google_compute_network.test.name}"
}
output "network1"{
// url for network
  value = "${google_compute_network.test.self_link}"
}
