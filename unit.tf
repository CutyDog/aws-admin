resource "aws_organizations_organizational_unit" "product_development" {
  name      = "product-development"
  parent_id = aws_organizations_organization.org.roots[0].id
}
