module "vpc"{
  source = "../modules/vpc/" 
  name = "test" 
}

module "compute"{
  source = "../modules/compute/"
  count = "2"
  image = "debian-cloud/debian-8"
  network = "${module.vpc.name}"

}
module "firewall"{
  network = "${module.vpc.name}"
  source = "../modules/firewall/"
  name = "test-firewall"
  protocol = "tcp"
  ports  = [80,8080]
}



