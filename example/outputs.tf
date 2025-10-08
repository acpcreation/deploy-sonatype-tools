output "ecr_uri" {
  description = "The URI of the ECR repository from the module"
  value       = module.ecr_module.repository_url
}