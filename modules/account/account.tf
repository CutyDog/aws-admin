resource "aws_organizations_account" "main" {
  name  = var.account_name
  email = "silver.soul.818+${var.account_name}@gmail.com"

  parent_id         = var.parent_id
  close_on_deletion = true
}