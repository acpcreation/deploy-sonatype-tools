locals {
  ecr_repo_name = "aplattel-container-registry"

  application_cluster_name     = "sonatype-application-cluster"
  availability_zones           = ["us-east-1a", "us-east-1b", "us-east-1c"]
  application_task_famliy      = "application-task"
  container_port               = 8070
  application_task_name        = "application-task"
  ecs_task_execution_role_name = "application-task-execution-role"

  application_load_balancer_name = "cc-application-alb"
  target_group_name              = "cc-application-alb-tg"

  application_service_name = "cc-application-service"
}
