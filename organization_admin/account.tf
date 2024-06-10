resource "aws_organizations_account" "audit" {
  name  = "audit"
  email = "${var.gmail_account}+audit@gmail.com"
}

resource "aws_organizations_account" "prd" {
  name  = "prd"
  email = "${var.gmail_account}+prd@gmail.com"

  parent_id         = aws_organizations_organizational_unit.product_development.id
  close_on_deletion = true
}
