
output "ec2_linux_helloworld-istio_public_ip" {
  value = module.ec2_linux_httpbin-istio.public_ip
  description = "addres to connect using ssh with user ubuntu"
}

output "ec2_linux_helloworld-istio_private_ip" {
  value = module.ec2_linux_httpbin-istio.private_ip
  description = "the internal ip"
}


