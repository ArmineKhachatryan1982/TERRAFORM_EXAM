#Creating Load balancer
resource "aws_lb" "test" {

  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_grp
  subnets            = var.subnet_ids

}
#Creating target group
resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
# Creating listener 
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

