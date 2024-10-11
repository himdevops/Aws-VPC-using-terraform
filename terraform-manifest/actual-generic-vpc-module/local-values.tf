# local value assigned name to an expression. That means we can use it multiple time 
#within modules without repeating it. 
# Local values are like a functions temporary local variable 
locals {
  environment = var.my-environment
  owners      = var.team_divsion
  name        = "${var.team_divsion}-${var.my-environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment

  }
