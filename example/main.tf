
# ECR Configuration
module "ecr_module"{
    source = "./modules/ecr"
    ecr_repo_name = local.ecr_repo_name
}


module "ecs_cluster" {
    source = "./modules/ecs"

    application_cluster_name = local.application_cluster_name
    availability_zones       = local.availability_zones

    application_task_famliy      = local.application_task_famliy
    ecr_repo_url                 = module.ecr_module.repository_url
    container_port               = local.container_port
    host_port                    = local.container_port
    application_task_name        = local.application_task_name
    ecs_task_execution_role_name = local.ecs_task_execution_role_name

    application_load_balancer_name = local.application_load_balancer_name
    target_group_name              = local.target_group_name
    application_service_name       = local.application_service_name
}



