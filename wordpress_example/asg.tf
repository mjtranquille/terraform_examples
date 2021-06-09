resource "aws_launch_template" "wp_asg_launch_template" {
  name_prefix   = "test"
  image_id      = var.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "wp_asg" {
  vpc_zone_identifier = [module.vpc.public_subnets[0],module.vpc.public_subnets[1]]
  desired_capacity = 2
  max_size = 3
  min_size = 2
  target_group_arns = [aws_lb_target_group.wp_tg.arn]

  launch_template {
    id = aws_launch_template.wp_asg_launch_template.id
    version = "$Latest"
  }
}

