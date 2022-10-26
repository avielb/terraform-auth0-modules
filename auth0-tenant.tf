module "auth0-tenant" {
  source   = "./modules/auth0-tenant"
  for_each = { for v in var.tenant : v.friendly_name => v }

  friendly_name           = each.value.friendly_name
  change_password         = each.value.change_password
  guardian_mfa_page       = each.value.guardian_mfa_page
  default_redirection_uri = each.value.default_redirection_uri
  sandbox_version         = each.value.sandbox_version
}
