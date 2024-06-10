locals {
  users = {
    taishi = var.taishi,
    yuta   = var.yuta,
    ryota  = var.ryota,
  }
}

resource "aws_identitystore_user" "prd" {
  for_each = local.users

  identity_store_id = var.identity_store_id
  display_name      = join(" ", [each.value.given_name, each.value.family_name])
  user_name         = each.value.email

  name {
    family_name = each.value.family_name
    given_name  = each.value.given_name
  }

  emails {
    value = each.value.email
  }
}
