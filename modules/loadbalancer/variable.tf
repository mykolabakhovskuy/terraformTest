variable project {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}
variable instances {
type = "list"
}
variable region {
  description = "Region for cloud resources."
  default     = "europe-west1"
}

variable network {
  description = "Name of the network to create resources in."
  default     = "default"
}

variable firewall_project {
  description = "Name of the project to create the firewall rule in. Useful for shared VPC. Default is var.project."
  default     = ""
}

variable name {
  description = "Name for the forwarding rule and prefix for supporting resources."
}

variable service_port {
  description = "TCP port your service is listening on."
}

variable target_tags {
  description = "List of target tags to allow traffic using firewall rule."
  type        = "list"
}

variable session_affinity {
  description = "How to distribute load. Options are `NONE`, `CLIENT_IP` and `CLIENT_IP_PROTO`"
  default     = "NONE"
}
