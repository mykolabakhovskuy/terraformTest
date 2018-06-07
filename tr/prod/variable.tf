variable "zone" {
// zone for you project
  default = "europe-west1-b"
}
variable "project-name" {
// name of you project in gcp  
  default = "bakhovskuy-gcp-create"
}
variable "credential" {
// PATH to you google cloud account service acoonut JSON 
  default = "~/.config/gcloud/bakhovskuy-gcp-create-555b4598cbcb.json"
}
variable "ssh"{
// PATH to you ssh public keys
  default = "~/.ssh/id_rsa.pub"
}
variable "region" {
// default region to you project
  default = "europe-west1"
}