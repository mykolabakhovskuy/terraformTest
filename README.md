# Terraform test projec

Terraform test project for practice.

# For local development and testing you need
 * GCP account
 * Terraform version 0.11.7 or higher

# To use :
 * Download Terraform
 * Creating Google Cloud service account for terraform
 * Change credential to Google Cloud in /prod/variables.tf
 * Use command
  ```sh
 terraform init
  ```
  to download dependensy

# In this project creates :
 * Two google compute instances for web servers 
 * One for databases
 * VPC network 
 * Firewall rules for ports 22,80,8080,3306
 * HTTP Load Balancer