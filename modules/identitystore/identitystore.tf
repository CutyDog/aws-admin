data "aws_ssoadmin_instances" "main" {}

resource "aws_identitystore_group" "main" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
  display_name      = var.group_name
}

resource "aws_identitystore_group_membership" "main" {
  for_each = { for user in var.users : user.user_name => user }

  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
  group_id          = aws_identitystore_group.main.group_id
  member_id         = each.value.user_id
}