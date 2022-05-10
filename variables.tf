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

variable "authorized_ssh_public_key" {
  type = string
}

variable "server_pw" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}
