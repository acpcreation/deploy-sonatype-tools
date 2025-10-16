# Deploy Sonatype Tooling

Tech:
- Terraform
- Postgres
- Helm
- Docker



Steps:
- Create ECS space (AWS Elastic Container Service) Fargate (serverless)
- Create ECR space (Elastic Container Registry)
- Create Postgres
- Pull Container
- Configure Postgres
- Push image to ECR
- Run container on ECS
- (for Nexus) Get default password


Resources
- App containerization and deploy to AWS: https://www.youtube.com/watch?v=1_AlV-FFxM8 



# Checkov
Using in WF:
1. Toggle off "Run command in same env"
2. Select and name the WF template
3. Command override: -d "/mnt/sg_workspace/user/IaC-Excercises" --download-external-modules false --soft-fail

Ignore issue: 
#checkov:skip=<check_id>:<suppression_comment>