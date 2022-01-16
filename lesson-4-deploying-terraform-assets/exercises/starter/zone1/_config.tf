terraform {
   backend "s3" {
     bucket = "udacity-tf-trevor01"
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
   }
 }

 provider "aws" {
   region = "us-east-2"
   #profile = "default"
   
   default_tags {
     tags = local.tags
   }
 }