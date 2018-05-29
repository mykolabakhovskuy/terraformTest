#module "vpc" {
#  source = "../modules/vpc"
#}

module "compute" {
  source =  "../modules/compute/"
}
