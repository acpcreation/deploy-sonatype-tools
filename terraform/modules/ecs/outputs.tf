output "application_url" {
    description = "The URL for web app"
    value = aws_alb.application_load_balancer.dns_name
} 