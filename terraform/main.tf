terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }
  backend "s3" {
       bucket = "terraform-state-bucket-aws-cloud-sandbox"
       key    = "arn:aws:kms:us-east-2:530869569617:key/c53c951f-5d82-45f0-aa68-510624dc6ec9"
       region = "us-east-2"
       encrypt = true
   }

}

provider "aws" {
  region  = "us-east-2"
}
