module "group_template_admin" {
  source = "../modules/identitystore"

  group_name   = "template_admin"
  target_id    = module.account_group_admin.aws_organizations_account.main.id
  users        = [
    aws_identitystore_user.main["fukushima_taishi"],
  ]
  assume_roles = [
    "arn:aws:iam::${local.aws_accounts["template-prd"].id}:role/administrator",
  ]
}

module "group_template_develop" {
  source = "../modules/identitystore"

  group_name   = "template_develop"
  target_id    = module.account_group_admin.aws_organizations_account.main.id
  users        = []
  assume_roles = [
    "arn:aws:iam::${local.aws_accounts["template-prd"].id}:role/developer",
  ]
}