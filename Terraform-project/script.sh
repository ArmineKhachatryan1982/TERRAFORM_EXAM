!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo “User data  from $(hostname -f).Created by USERDATA in Terraform. SUBSCRIBE NOW!!” (arrow_symbol) /var/www/html/index.html