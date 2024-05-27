resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr_block_vpc
    tags = {
    Name = var.vpcname
    }
  
}
resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_block_publicsubnet
  
}
resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_block_privatesubnet
  
}
resource "aws_internet_gateway" "mygateway" {
    vpc_id = aws_vpc.myvpc.id
    
}
resource "aws_route_table" "publicRT" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = var.routecidr
        gateway_id = aws_internet_gateway.mygateway.id
    }
  
}
resource "aws_route_table_association" "pubicrtassociation" {
    subnet_id = aws_subnet.publicsubnet.id
    route_table_id = aws_route_table.publicRT.id
  
}
resource "aws_security_group" "mysg" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name=var.securitygroupname
    }
    ingress {
    from_port   = var.port_no_inbound
    to_port     = var.port_no_inbound
    protocol    = "tcp"
    cidr_blocks = [var.cidr_block_inbound]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

  
}