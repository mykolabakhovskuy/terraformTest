variable "count"{
  description = "instances count"
}
variable "image"{
  description = "Image to our compute engine instances"
}
variable "network"{
  description = "name of network to our instances write here"
}
variable "path"{
  default = "../modules/scripts/default.sh"
}
variable "name"{
  description = "name of instances"
}
variable "tags"{
  description = "tags of you instancces. Be careful type list!!"
  type = "list"

}
variable "zone"{
  description = "zone of you project"
}
variable "ssh"{
  description = "path to ssh keys"
}
variable "instance_type"{
  description = "instance type"
}
