terraform {
  backend "s3" {
    bucket = "udacity-tf-ud-trevor"
    key    = "terraform/terraform.tfstate"
    region = "us-east-2"
  }
  # required_providers {
  #   aws = {
  #     source                = "hashicorp/aws"
  #     version               = ">=3.73.0"
  #     configuration_aliases = [aws.usw1]
  #   }
  # }

}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = local.tags
  }
}

provider "aws" {
  alias  = "usw1"
  region = "us-west-2"
}
