# STATE FILE MANAGEMENT
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

    backend "local" {}
}

