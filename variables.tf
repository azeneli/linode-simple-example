variable "jr_anton_image" {
  type = string
  default = "linode/ubuntu20.04"
}

variable "jr_anton_region" {
  type = string
  default = "ap-southeast"
}

variable "jr_anton_instance_type" {
  type = string
  default = "g6-standard-1"
}

variable "linode_token" {
  type = string
}

output "linode_token_output" {
  value = var.linode_token
  sensitive = true
}

variable "authorized_ssh_public_key" {
  type = string
}

output "authorized_ssh_public_key_output" {
  value = var.authorized_ssh_public_key
  sensitive = true
}

variable "server_pw" {
  type = string
}

output "server_pw_output" {
  value = var.server_pw
  sensitive = true
}

variable "access_key" {
  type = string
}

output "access_key_output" {
  value = var.access_key
  sensitive = true
}

variable "secret_key" {
  type = string
}

output "secret_key_output" {
  value = var.secret_key
  sensitive = true
}
