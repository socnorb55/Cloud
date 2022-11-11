terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">=0.14.9"
  
  backend "s3" {
       bucket = "terraform-state-bucket-aws-cloud-sandbox"
       key    = "arn:aws:kms:us-east-2:530869569617:key/c53c951f-5d82-45f0-aa68-510624dc6ec9"
       region = "us-east-2"
   }

}

provider "aws" {
  version = "~>3.0"
  region  = "us-eat-2"
}
