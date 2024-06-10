locals {
  groups = {
    prd_admin = "group_prd_admin",
    prd_dev   = "group_prd_dev",
  }
}

resource "aws_identitystore_group" "prd" {
  for_each = local.groups

  identity_store_id = var.identity_store_id
  display_name      = each.value
}
