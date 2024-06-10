locals {
  permissions = {
    prd_admin = {
      name = "prd_admin",
      managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess",
    },
    prd_dev = {
      name = "prd_dev",
      managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess",
    },
  }
}

resource "aws_ssoadmin_permission_set" "prd" {
  for_each = local.permissions

  instance_arn = var.sso_instance_arn
  name         = each.value.name
}

resource "aws_ssoadmin_managed_policy_attachment" "prd" {
  for_each = local.permissions

  instance_arn       = var.sso_instance_arn
  managed_policy_arn = each.value.managed_policy_arn
  permission_set_arn = aws_ssoadmin_permission_set.prd[each.value.name].arn
}

resource "aws_ssoadmin_account_assignment" "prd" {
  for_each = local.permissions

  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.prd[each.value.name].arn
  principal_id       = aws_identitystore_group.prd[each.value.name].group_id
  principal_type     = "GROUP"

  target_id   = var.prd_aws_account_id
  target_type = "AWS_ACCOUNT"
}
