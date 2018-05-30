module "vpc"{
  source = "../modules/vpc/" 
  name = "test"
  network = "${module.vpc.name}"
  name = "test-firewall"
  protocol = "tcp"
  ports  = [80,8080] 
}

module "webservers"{
  source = "../modules/compute/"
  name   = "webserver"
  network = "${module.vpc.name}"
  count = "2"
  image = "debian-cloud/debian-8"
  path = "../modules/scripts/nginx.sh"
}
module "database"{
  source = "../modules/compute/"
  name   = "database"
  network = "${module.vpc.name}"
  count = "1"
  image = "debian-cloud/debian-8"
  path = "nginx.sh"
}


#module "loadbalancer"{
#  source = "../modules/loadbalancer"
#  region       = "europe-west1"
#  name         = "test-lb"
#  service_port = "80"
#  target_tags  = ["test"] 
#}
module "storage"{
  source = "../modules/storage"
  name  = "bahovskuystoragegcp"
  location = "EU"
  storage_class = "MULTI_REGIONAL"
}
