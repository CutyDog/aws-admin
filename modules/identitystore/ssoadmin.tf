resource "aws_ssoadmin_permission_set" "main" {
  instance_arn = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  name         = var.group_name
}

data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    resources = var.assume_roles
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "main" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.main.arn
  inline_policy      = data.aws_iam_policy_document.main.json
}

resource "aws_ssoadmin_account_assignment" "main" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.main.arn
  principal_id       = aws_identitystore_group.main.group_id
  principal_type     = "GROUP"
  target_id          = var.target_id
  target_type        = "AWS_ACCOUNT"
}