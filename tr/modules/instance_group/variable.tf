variable "name"{
  description = "name of you instance group"
}
variable "zone"{
  description = "default zone where you instance group creates"
}
variable "network"{
  description = "name of network to our instances group write here"
}
variable "instances" {
  description = "List of you instances name"
  type = "list"
}
