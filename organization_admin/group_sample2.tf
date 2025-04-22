module "group_sample2_admin" {
  source = "../modules/identitystore"

  group_name   = "sample_admin"
  target_id    = module.account_group_admin.aws_organizations_account.main.id
  users        = [
    aws_identitystore_user.main["fukushima_taishi"],
  ]
  assume_roles = [
    "arn:aws:iam::${local.aws_accounts["sample2-prd"].id}:role/administrator",
    "arn:aws:iam::${local.aws_accounts["sample2-dev"].id}:role/administrator",
  ]
}

module "group_sample2_develop" {
  source = "../modules/identitystore"

  group_name   = "sample_develop"
  target_id    = module.account_group_admin.aws_organizations_account.main.id
  users        = [
    aws_identitystore_user.main["hattori_yuta"],
    aws_identitystore_user.main["kobayashi_ryota"],
  ]
  assume_roles = [
    "arn:aws:iam::${local.aws_accounts["sample2-prd"].id}:role/developer",
    "arn:aws:iam::${local.aws_accounts["sample2-dev"].id}:role/developer",
  ]
}