data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }

}

resource "aws_iam_role" "ec2-bastion-role" {
  name = "ec2-bastion-role"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_instance_profile" "ec2-bastion-profile" {
  name = "ec2-bastion-intance-profile"
  role = aws_iam_role.ec2-bastion-role.name
}
