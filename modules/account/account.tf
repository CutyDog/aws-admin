resource "aws_organizations_account" "account" {
  name  = var.account_name
  email = "${var.gmail_account}+${var.account_name}@gmail.com"

  parent_id         = var.parent_id
  close_on_deletion = var.close_on_deletion
}