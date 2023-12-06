resource "aws_security_group" "ec2-bastion-sg" {
  description = "Bastion Security Group"
  name        = "ec2-bastion-sg"
  vpc_id      = var.vpc
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ec2-bastion-ingress-ip-1]
    description = "Allowed ingress CIDR"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
    description      = "IPv6 route to internet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "IPv4 route to internet"
  }
}