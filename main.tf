provider "linode" {
   token = var.linode_token
}

data "linode_object_storage_cluster" "primary" {
   id = "eu-central-1"
}

resource "linode_object_storage_bucket" "jr_tf_state" {
   access_key = var.access_key
   secret_key = var.secret_key

   cluster = data.linode_object_storage_cluster.primary.id
   label   = "my-tf-state"
}

resource "linode_instance" "jr_anton" {
   image = var.jr_anton_image
   label = "jr_anton"
   region = var.jr_anton_region
   type = var.jr_anton_instance_type
   authorized_keys = [var.authorized_ssh_public_key]
   root_pass = var.server_pw


  interface {
    purpose = "public"
  }

  interface {
    purpose = "vlan"
    label = "jr-anton-vlan"
    ipam_address = "10.0.0.1/24"
  }
}

resource "linode_volume" "jr_anton_storage" {
   label = "jr_anton_storage_for_server"
   region = var.jr_anton_region
   linode_id = linode_instance.jr_anton.id
}

resource "linode_instance_ip" "jr_anton" {
  linode_id = linode_instance.jr_anton.id
  public = "true"
}

resource "linode_firewall" "jr_anton_firewall"{
   label = "Jr_Anton_firewall_protection"
  
   inbound {
      label = "allow-http"
      action = "ACCEPT"
      protocol = "TCP"
      ports = "80"
      ipv4 = ["0.0.0.0/0"]
   }

   inbound {
     label = "allow-https"
     action = "ACCEPT"
     protocol = "TCP"
     ports = "443"
     ipv4 = ["0.0.0.0/0"]
   }

   inbound_policy = "ACCEPT"
 
   outbound {
     label    = "reject-http"
     action   = "DROP"
     protocol = "TCP"
     ports    = "80"
     ipv4     = ["0.0.0.0/0"]
   }

   outbound {
     label    = "reject-https"
     action   = "DROP"
     protocol = "TCP"
     ports    = "443"
     ipv4     = ["0.0.0.0/0"]
   }

   outbound_policy = "ACCEPT"

   linodes = [linode_instance.jr_anton.id]
}
