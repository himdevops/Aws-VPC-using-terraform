#generic varibles which we are going to use most of time 
#AWS Region
# this varibes will be override by terraform.tfvars 
#Put one line space between each variable 

variable "aws_region" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "us-east-1"
  
}

# Environment variabl 
variable "my-environment" {
    description = "Environment varible used as a prefix"
    type = string
    default = "test"
  
}

# Business Division
variable "team_divsion" {
  description = "team Division in the large organization this Infrastructure belongs"
  type = string
  default = "Team-name1"
}
