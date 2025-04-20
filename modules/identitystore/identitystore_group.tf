resource "aws_identitystore_group" "group" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.main.identity_store_ids)[0]
  display_name      = var.group_name
}