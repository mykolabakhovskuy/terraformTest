# Gcp-terraform-test

 [Terraform](https://www.terraform.io/) test project for gcp pre prod.



# In this project creates :
 * Two google compute instances for web servers 
 * One for databases
 * VPC network 
 * Firewall allow rule for ports 22,80,8080,3306
 * HTTP Load Balancer

# For local development and testing you need
 * GCP account 
 * Ssh keys
 * Terraform version 0.11.7 or higher

# To use :
 * Download [Terraform](https://www.terraform.io/downloads.html)
 * [Creat Google Cloud project](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
 * Create iam account to google cloud
 ```bash
$ gcloud iam service-accounts create SA-NAME \
    --display-name "SA-DISPLAY-NAME"
 ```
 * Create and download keys to you service account in JSON format
 ```bash
 $ gcloud iam service-accounts keys create ~/key.json \
    --iam-account SA-NAME@PROJECT-ID.iam.gserviceaccount.com
 ```
 * If you dont have ssh key create it. 
 ```bash
  $ ssh-keygen
 ```
 
 * Change  variable  in ``/tr/prod/variable.tf``

 * Use command to download dependencies
 ```bash
 $ terraform init
 ``` 
 * Use command to build infrastructure in cloud 
 ```bash
 $ terraform apply
 ``` 
 * Use command to delete infrastructure from cloud
 ```
 $ terrafom destroy
 ```
