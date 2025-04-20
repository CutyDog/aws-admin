variable "group_name" { type = string }
variable "users" { type = list(any) }
variable "aws_account_id" { type = string }
variable "managed_policy_arn" { type = string }