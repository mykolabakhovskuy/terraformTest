variable "count"{
}
variable "image"{
}
variable "network"{
}
variable "path"{
  default = "../modules/scripts/default.sh"
}
variable "name"{}
variable "tags"{
type = "list"
}
variable "zone"{}
variable "ssh"{
description = "path to ssh keys"
}
