# Initialize ECR for storing containers and S3 bucket for state files

terraform {
    required_version = "~>v1.4"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
    # backend "s3" {
    #     bucket = "sonatype-nexus-state-sg-26cdd7f4"  
    #     key    = "terraform.tfstate"
    #     region = "us-east-1"
    #     dynamodb_table = "terraform-locks"
    # }

    # backend "local" {}
}

# ECR Configuration
module "ecr_module"{
    source = "./modules/ecr"
    ecr_repo_name = "${var.ecr_repo_name_input}-${random_id.suffix.hex}"
}

output "ecr_uri" {
  description = "The URI of the ECR repository from the module"
  value       = module.ecr_module.repository_url
}

variable "ecr_repo_name_input" {
  description = "AWS Elastic Container Registry name"
  default     = "Repository-Name"
  type        = string
}

resource "random_id" "suffix" {
  byte_length = 4
}



# CREATE S3 BUCKET FOR STATE FILE
# (Migrate from local [below] to above)


# --- Create the S3 bucket ---
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "sonatype-nexus-state-sg-${random_id.suffix.hex}"

#   tags = {
#     Name        = "Terraform State Bucket"
#     Environment = "dev"
#   }
# }


# Optional: block public access
# resource "aws_s3_bucket_public_access_block" "public_access" {
#   bucket = aws_s3_bucket.terraform_state.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

# # Optional: enable versioning (helps recover old state)
# resource "aws_s3_bucket_versioning" "versioning" {
#   bucket = aws_s3_bucket.terraform_state.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# # Optional: create DynamoDB table for state locking
# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "sonatype-terraform-state"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# output "terraform_state_bucket_name" {
#   description = "The name of the S3 bucket used for Terraform remote state"
#   value       = aws_s3_bucket.terraform_state.bucket
# }







