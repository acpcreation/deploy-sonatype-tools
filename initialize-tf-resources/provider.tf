provider "aws" {
  region     = var.aws_region
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}
