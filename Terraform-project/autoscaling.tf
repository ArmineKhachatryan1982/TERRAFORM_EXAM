
locals {
  ami_id = "ami-019f9b3318b7155c5"
  instance_type = "t2.micro"
  subnet_ids = [
    "subnet-0bb6fda626d74b0ae",
    "subnet-09f6eceeabe51873f",
    "subnet-04fc4d11191214caa"
   
  ]
  
 
}
resource "aws_launch_configuration" "my_launch_configuration" {
  name          = "my-launch-configuration"
  image_id      = local.ami_id
  instance_type = local.instance_type
  security_groups = ["sg-010ee67d4f250712f"]  
  user_data = filebase64("script.sh")
}

# Define the Auto Scaling Group
resource "aws_autoscaling_group" "my_auto_scaling_group" {
  name              = "my-auto-scaling-group"
  launch_configuration = aws_launch_configuration.my_launch_configuration.name
  min_size          = 1
  max_size          = 3
  desired_capacity  = 2
  vpc_zone_identifier = local.subnet_ids
}
