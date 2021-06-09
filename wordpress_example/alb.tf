resource "aws_lb" "wp_alb" {
  name = "wp-alb"
  load_balancer_type = "application"
  subnets = module.vpc.public_subnets
  security_groups = [aws_security_group.base_sg.id]
}

resource "aws_lb_target_group" "wp_tg" {
    name = "wp-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = module.vpc.vpc_id

    health_check {
      path = "/health.html"
      matcher = "200"
    }
}
resource "aws_lb_listener" "wp_lb_listener_http" {
  load_balancer_arn = aws_lb.wp_alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.wp_tg.arn
   }
}

