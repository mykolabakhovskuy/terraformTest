module "vpc"{
  source = "../modules/vpc/" 
  name = "test"
  network = "${module.vpc.name}"
  namefirewall = "${module.vpc.name}firewall"
  name = "test"
  protocol = "tcp"
  ports  = [22,80,8080,3306]
}

module "webservers"{
  source = "../modules/compute/"
  name   = "webserver"
  network = "${module.vpc.name}"
  count = "2"
  image = "debian-cloud/debian-8"
  path = "../modules/scripts/nginx.sh"
  tags = ["webserver"]
  zone = "europe-west1-b"
}
module "database"{
  source = "../modules/compute/"
  name   = "database"
  network = "${module.vpc.name}"
  count = "1"
  image = "debian-cloud/debian-8"
  path = "../modules/scripts/mysql.sh"
  tags = ["database"]
  zone = "europe-west1-b"
}
module "loadbalancer"{
  instances = "${module.webservers.names}"
  project = "bakhovskuy-gcp-create"
  source = "../modules/loadbalancer"
  region       = "europe-west1"
  name         = "test-lb"
  service_port = "80"
  target_tags  = ["test"] 
}
module "storage"{
  source = "../modules/storage"
  name  = "bahovskuystoragegcp"
  location = "EU"
  storage_class = "MULTI_REGIONAL"
}
