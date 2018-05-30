module "vpc"{
  source = "../modules/vpc/" 
  name = "test"
  network = "${module.vpc.name}"
  name = "test-firewall"
  protocol = "tcp"
  ports  = [80,8080] 
}

module "compute"{
  source = "../modules/compute/"
  network = "${module.vpc.name}"
  count = "2"
  image = "debian-cloud/debian-8"
}
#module "loadbalancer"{
#  source = "../modules/loadbalancer"
#  region       = "europe-west1"
#  name         = "test-lb"
#  service_port = "80"
#  target_tags  = ["test"] 
#}
module "sorage"{
  source = "../modules/storage"
  name  = "bahovskuystoragegcp"
  location = "EU"
  storage_class = "REGIONAL"
}
