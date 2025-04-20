resource "aws_ssoadmin_permission_set" "permission_set" {
  instance_arn = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  name         = var.group_name
}

resource "aws_ssoadmin_managed_policy_attachment" "managed_policy_attachment" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  managed_policy_arn = var.managed_policy_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
}

resource "aws_ssoadmin_account_assignment" "account_assignment" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.main.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
  principal_id       = aws_identitystore_group.group.group_id
  principal_type     = "GROUP"
  target_id          = var.aws_account_id
  target_type        = "AWS_ACCOUNT"
}
