module "vpc" {
  source = "../vpc"  # Adjust the path to the vpc module directory as needed

  vpc_cidr           = "10.0.0.0/16"   # Set your VPC CIDR here
  private_subnet1_cidr        = "10.0.1.0/24"   # Set your Subnet CIDR here
  private_subnet2_cidr        = "10.0.2.0/24" 
  availability_zone_private_subnet1 = "ap-south-1a"   # Set your Availability Zone here
  availability_zone_private_subnet2 = "ap-south-1b"
}

resource "aws_security_group" "elb_security_group" {
  name        = var.elb_security_group_name
  description = "Security group for ELB"
  vpc_id      =  module.vpc.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.common_cidr]
  }
}


resource "aws_lb" "example_alb" {
  name               = "example-alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = [module.vpc.private_subnet1_id,module.vpc.private_subnet2_id]
  enable_deletion_protection = false
  security_groups    = [aws_security_group.elb_security_group.id]
}
resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type    = "text/plain"
      status_code     = "200"
      #content         = "OK"
    }
  }
}
/* resource "aws_lb_target_group" "jenkins_target_group" {
  name     = "jenkins-target-group"
  port     = 8080 # Port where Jenkins is running.
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

 

resource "aws_lb_target_group_attachment" "jenkins_target" {
  target_group_arn = aws_lb_target_group.jenkins_target_group.arn
   target_id        = "Built-In Node" # Replace with your Jenkins instance ID.
} */