module "account_sample2" {
  source = "../modules/account"

  account_name = "sample2"
  parent_id    = aws_organizations_organizational_unit.admin.id
}

module "group_sample2_admin" {
  source = "../modules/identitystore"

  group_name   = "sample_admin"
  users        = [
    aws_identitystore_user.main["fukushima_taishi"],
  ]
  assume_roles = [
    "arn:aws:iam::${local.aws_accounts["sample2-prd"].id}:role/administrator",
    "arn:aws:iam::${local.aws_accounts["sample2-dev"].id}:role/administrator",
  ]
  target_id    = module.account_sample2.aws_organizations_account.main.id
}

module "group_sample2_develop" {
  source = "../modules/identitystore"

  group_name   = "sample_develop"
  users        = [
    aws_identitystore_user.main["hattori_yuta"],
    aws_identitystore_user.main["kobayashi_ryota"],
  ]
  assume_roles = [
    "arn:aws:iam::${local.aws_accounts["sample2-prd"].id}:role/developer",
    "arn:aws:iam::${local.aws_accounts["sample2-dev"].id}:role/developer",
  ]
  target_id    = module.account_sample2.aws_organizations_account.main.id
}
