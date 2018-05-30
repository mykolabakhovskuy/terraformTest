module "compute"{
  source = "../modules/compute/"
  count = "2"
  image = "debian-cloud/debian-8"

}

module "firewall"{
  source = "../modules/firewall/"
  name = "test-firewall"
  protocol = "tcp"
  ports  = [80,8080]
}



