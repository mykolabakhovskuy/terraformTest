// create default vpc network
module "vpc"{
  source = "../modules/vpc/" 
  name = "test"
// create firewall rules
  namefirewall = "${module.vpc.name}firewall"
  name = "test"
  protocol = "tcp"
  ports  = [22,80,8080,3306]
}
// create two compute instances for webservers
module "webservers"{
  source = "../modules/compute/"
  name   = "webserver"
  instance_type = "f1-micro"
  network = "${module.vpc.name}"
  count = "2"
  image = "debian-cloud/debian-8"
  path = "../modules/scripts/nginx.sh"
  tags = ["webserver"]
  zone = "${var.zone}"
  ssh = "${var.ssh}"
}
module "database"{
// create one compute instances for database
  source = "../modules/compute/"
  name   = "database"
  instance_type = "n1-standard-1"
  network = "${module.vpc.name}"
  count = "1"
  image = "debian-cloud/debian-8"
  path = "../modules/scripts/mysql.sh"
  tags = ["database"]
  zone = "${var.zone}"
  ssh  = "${var.ssh}"
}
// create Exteran load balancer for two webserver instances 
module "loadbalancer"{
// transfer instances url from webserver module to loadbalancer
  instances = "${module.webservers.url}"
  project = "bakhovskuy-gcp-create"
  source = "../modules/loadbalancer"
  region       = "${var.region}"
  name         = "test-lb"
  service_port = "80"
  target_tags  = ["test"] 
}
// create Multi region cloud storage 
module "storage"{
  source = "../modules/storage"
  name  = "bahovskuystoragegcp"
  location = "EU"
  storage_class = "MULTI_REGIONAL"
}
