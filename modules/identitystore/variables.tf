variable "group_name" { type = string }
variable "users" { type = list(any) }
variable "assume_roles" { type = list(string) }
variable "target_id" { type = string }