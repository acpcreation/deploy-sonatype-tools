locals {
  application_name = "sonatype"
  container_port   = 8070
  ecr_repo_url     = "470037505301.dkr.ecr.us-east-1.amazonaws.com/aplattel-container-registry"
  ecr_repo_name    = "aplattel-container-registry"
  
  

  application_cluster_name     = "sonatype-application-cluster"
  availability_zones           = ["us-east-1a", "us-east-1b", "us-east-1c"]
  application_task_famliy      = "application-task"
  application_task_name        = "application-task"
  ecs_task_execution_role_name = "application-task-execution-role"

  
  target_group_name        = "cc-application-alb-tg"
  application_service_name = "cc-application-service"
}

# variable "application_name" {
#   description = "Application Name"
#   default     = "sonatype"
#   type        = string
# }

# variable "container_port" {
#   description = "Container Port"
#   default     = 8081
#   type       = number
# }

# variable "ecr_repo_url" {
#   description = "ECR URL"
#   default     = "470037505301.dkr.ecr.us-east-1.amazonaws.com/aplattel-container-registry"
#   type        = string
# }

# variable "application_cluster_name" {
#   description = "ECS Cluster Name"
#   default     = "sonatype-application-cluster"
#   type        = string
# }




