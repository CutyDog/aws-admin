resource "aws_organizations_organizational_unit" "sample" {
  name      = "sample"
  parent_id = aws_organizations_organization.org.roots[0].id
}

#####################
### sample-prd
#####################
module "account_sample-prd" {
  source = "../modules/account"

  gmail_account = var.gmail_account
  account_name  = "sample-prd"
  parent_id     = aws_organizations_organizational_unit.sample.id

  close_on_deletion = true
}

module "identitystore_group_sample-prd_administrators" {
  source = "../modules/identitystore"

  group_name         = "sample-prd-administrators"
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  users              = [
    aws_identitystore_user.main["fukushima_taishi"],
  ]
  aws_account_id     = module.account_sample-prd.aws_organizations_account.account.id
}

module "identitystore_group_sample-prd_developers" {
  source = "../modules/identitystore"

  group_name         = "sample-prd-developers"
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  users              = [
    aws_identitystore_user.main["hattori_yuta"],
    aws_identitystore_user.main["kobayashi_ryota"],
  ]
  aws_account_id     = module.account_sample-prd.aws_organizations_account.account.id
}

#####################
### sample-dev
#####################
module "account_sample-dev" {
  source = "../modules/account"

  gmail_account = var.gmail_account
  account_name  = "sample-dev"
  parent_id     = aws_organizations_organizational_unit.sample.id

  close_on_deletion = true
}

module "identitystore_group_sample-dev_administrators" {
  source = "../modules/identitystore"

  group_name         = "sample-dev-administrators"
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  users              = [
    aws_identitystore_user.main["fukushima_taishi"],
  ]
  aws_account_id     = module.account_sample-dev.aws_organizations_account.account.id
}

module "identitystore_group_sample-dev_developers" {
  source = "../modules/identitystore"

  group_name         = "sample-dev-developers"
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  users              = [
    aws_identitystore_user.main["hattori_yuta"],
    aws_identitystore_user.main["kobayashi_ryota"],
  ]
  aws_account_id     = module.account_sample-dev.aws_organizations_account.account.id
}
