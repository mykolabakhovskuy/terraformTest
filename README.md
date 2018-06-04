# Gcp-terraform-test

Terraform test project for gcp pre prod labs.

# For local development and testing you need
 * GCP account
 * Terraform version 0.11.7 or higher

# To use :
 * Download Terraform
 * Creating Google Cloud service account for terraform
 * Change credential to Google Cloud in /prod/variables.tf
 * Use command ```"terraform init"``` to download dependensy
 * Use command ```"terraform apply"``` to build infrastructure in cloud  

# In this project creates :
 * Two google compute instances for web servers 
 * One for databases
 * VPC network 
 * Firewall rules for ports 22,80,8080,3306
 * HTTP Load Balancer