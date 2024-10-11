# Create VPC Terraform Module
module "vpc" {              #here vpc is local name we can put anyother name to
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"
    
  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"       #total 65000 ips 
  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

  # Database Subnets
  create_database_subnet_group = true      
  create_database_subnet_route_table= true    #need routetable for database sepratly
  database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]
  #default is false. 
  #create_database_nat_gateway_route = true    # public route via public nat gatway
  #create_database_internet_gateway_route = true   # you need databse to be publicly accessable 

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true   # false for production grade env as we need nat gatway per az. 

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner = "himdevops"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true
}

#block vs arguments . If anything{} its block but anything = {} equals is an argument. 

