#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
echo "<h1>Welcome to Terraform Associate certification from Utrains team ! AWS Infra created using Terraform in us-west-2 Region</h1>" | sudo tee /var/www/html/index.html