output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.my-ec2-demo.*.public_ip
}
output "ec2_publicdns" {
  description = "Public DNS URL of an EC2 Instance"
  value       = aws_instance.my-ec2-demo.*.public_dns
}