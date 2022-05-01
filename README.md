# Simple Linode Terraform Deployment

This is a simple/non-complex project of using Terraform with Linode as the cloud provider to deploy a server instance, that includes storage, vlan, and firewall.

I'm storing sensitive credentials in a secrets.tfvars file and the file is passed down as an argument when deploying the infrastructure

During my research, I found that Linode Terraform examples can be hard to find and they are outdated. I hope that my example will provide some guidance (not best practices but will work on that)


# Running the code
You will need to create a secrets.tfvars file to store sensitive credentials 

terraform plan -var-file="secrets.tfvars"

terraform apply -var-file="secrets.tfvars"