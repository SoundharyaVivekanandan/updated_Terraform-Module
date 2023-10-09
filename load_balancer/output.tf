# load_balancer/outputs.tf

output "elb_dns_name" {
  description = "DNS name of the created Elastic Load Balancer"
  value       = aws_lb.example_alb.dns_name
}
