###########################
#                         #
# Resource Security Group #
#        (Firewall)       #
#                         #
###########################

module "linux_server_fw" {
  source = "../modules/aws/tf-aws-security-group"

  name        = "linux_fw"
  description = "Security group for managment server with SSH port open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules	= ["ssh-tcp", "all-icmp"]
  egress_rules = ["dns-tcp", "dns-udp", "http-80-tcp", "https-443-tcp","all-icmp"]

}
