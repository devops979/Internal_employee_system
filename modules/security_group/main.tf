#######################################
# ALB Security Group
#######################################
resource "aws_security_group" "alb" {
  name   = "${var.project}-alb-sg"
  vpc_id = var.vpc_id
  tags   = { Name = "${var.project}-alb-sg" }

  dynamic "ingress" {
    for_each = var.alb_ingress_ports
    content {
      description = "ALB listener"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.alb_ingress_cidrs
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#######################################
# Backend NodeGroup / Pod Security Group
#######################################
resource "aws_security_group" "backend" {
  name   = "${var.project}-backend-sg"
  vpc_id = var.vpc_id
  tags   = { Name = "${var.project}-backend-sg" }

  # No ingress rules here.
  # K8s NodePort traffic will arrive on the worker node's primary
  # security group; backend pods only need egress to RDS.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
