resource "auth0_client_grant" "my_client_grant" {
  client_id = var.client_id
  audience  = var.audience
  scope    = var.scopes
}