output "aws_identitystore_group" {
  value = {
    group = aws_identitystore_group.group
  }
}

output "aws_identitystore_group_membership" {
  value = {
    group_membership = aws_identitystore_group_membership.group_membership
  }
}
