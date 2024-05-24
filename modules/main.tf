module "ec2" {
  source = "./ec2"
  instance_type = var.instance_type
  ami = var.ami_id
  subnet = module.vpc.vpc
}



module "s3" {
  source = "./s3"
  bucketname =  var.bucket
}

module "role" {
  source = "./IAM"
  role = var.role
}





module "vpc" {
  source = "./vpc"
 vpcname = var.vpcname
 cidr_block_vpc = var.cidr_block_vpc
 publicsubnetname = var.publicsubnetname
 cidr_block_publicsubnet = var.cidr_block_publicsubnet
 privatesubnetname = var.cidr_block_privatesubnet
 cidr_block_privatesubnet = var.cidr_block_privatesubnet
 routecidr = var.routecidr
 securitygroupname = var.securitygroupname
 port_no_inbound = var.port_no_inbound
 cidr_block_inbound = var.cidr_block_inbound

}




