#################
#               #
# VPC - Network #
#               #
#################

module "vpc" {
  source = "../modules/aws/tf-aws-vpc/"

  name = "onboardvm2tsb"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  enable_dns_hostnames = true

  tags = {
    Name = "onboarding-vm"
    Terraform = "true"
    Environment = "devel"
  }
}
