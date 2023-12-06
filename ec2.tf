resource "aws_instance" "ec2-bastion-host" {
  ami                         = var.aimid
  instance_type               = "t3.nano"
  vpc_security_group_ids      = [aws_security_group.ec2-bastion-sg.id]
  subnet_id                   = var.subnetid
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2-bastion-profile.name
  key_name                    = var.keyname
}