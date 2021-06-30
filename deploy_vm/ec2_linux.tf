module "ec2_linux_httpbin-istio" {
  source                 = "../modules/aws/tf-aws-ec2"

  name                   = "onboardvm"
  key_name               = aws_key_pair.keypair.key_name

  ami                    = "ami-0b5add21e87587ae1"
  instance_type          = "t3.small"
  instance_count         = 1
  monitoring             = false
  user_data = local.user_data
  vpc_security_group_ids = [ module.linux_server_fw.security_group_id ] 
  subnet_ids             = [ module.vpc.public_subnets[0], module.vpc.private_subnets[0]] 

  tags = {
    Terraform   = "true"
    Environment = "devel"
    linux	= "true"
  }
}
