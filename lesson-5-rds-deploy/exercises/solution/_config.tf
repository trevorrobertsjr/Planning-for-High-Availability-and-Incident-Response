terraform {
  backend "s3" {
    bucket = "udacity-tf-ud-trevor"
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

provider "aws" {
  alias  = "usw1"
  region = "us-west-2"
}
