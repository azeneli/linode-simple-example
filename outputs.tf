output "linode_token_output" {
  value = var.linode_token
  sensitive = true
}

output "authorized_ssh_public_key_output" {
  value = var.authorized_ssh_public_key
  sensitive = true
}

output "server_pw_output" {
  value = var.server_pw
  sensitive = true
}

output "access_key_output" {
  value = var.access_key
  sensitive = true
}

output "secret_key_output" {
  value = var.secret_key
  sensitive = true
}