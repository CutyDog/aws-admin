resource "aws_ssoadmin_permission_set" "admin" {
  instance_arn = var.sso_instance_arn
  name         = "admin"
}

resource "aws_ssoadmin_managed_policy_attachment" "admin" {
  instance_arn       = var.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.admin.arn
}

resource "aws_ssoadmin_permission_set" "dev" {
  instance_arn = var.sso_instance_arn
  name         = "dev"
}

resource "aws_ssoadmin_managed_policy_attachment" "dev" {
  instance_arn       = var.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.dev.arn
}
