locals {
  memberships = {
    prd_admin = {
      taishi = var.taishi,
    },
    prd_dev = {
      yuta   = var.yuta,
      ryota  = var.ryota,
    },
  }
}

resource "aws_identitystore_group_membership" "prd_admin" {
  for_each = local.memberships["prd_admin"]

  identity_store_id = var.identity_store_id
  group_id          = aws_identitystore_group.prd["prd_admin"].group_id
  member_id         = aws_identitystore_user.prd[each.value.given_name].user_id
}

resource "aws_identitystore_group_membership" "prd_dev" {
  for_each = local.memberships["prd_dev"]

  identity_store_id = var.identity_store_id
  group_id          = aws_identitystore_group.prd["prd_dev"].group_id
  member_id         = aws_identitystore_user.prd[each.value.given_name].user_id
}
