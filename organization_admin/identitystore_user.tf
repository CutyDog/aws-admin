resource "aws_identitystore_user" "main" {
  for_each = var.identitystore_users

  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
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