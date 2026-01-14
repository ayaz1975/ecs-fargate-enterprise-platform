output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "alb_arn_suffix" {
  value = aws_lb.this.arn_suffix
}

output "target_group_blue_arn" {
  value = aws_lb_target_group.blue.arn
}

output "target_group_green_arn" {
  value = aws_lb_target_group.green.arn
}

output "target_group_blue_arn_suffix" {
  value = aws_lb_target_group.blue.arn_suffix
}

output "target_group_green_arn_suffix" {
  value = aws_lb_target_group.green.arn_suffix
}

output "https_listener_arn" {
  value = aws_lb_listener.https.arn
}

output "alb_zone_id" {
  value = aws_lb.this.zone_id
}
