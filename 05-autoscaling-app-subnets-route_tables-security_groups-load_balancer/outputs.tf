output "vpc_id" {
  value = aws_vpc.this.id
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}

output "subnet_ids" {
  value = local.subnet_ids
}

output "route_table_assossiation_ids" {
  value = [for k, v in aws_route_table_association.this : v.id]
}

output "sg_web_id" {
  value = aws_security_group.web.id
}

output "sg_db_id" {
  value = aws_security_group.db.id
}

output "sg_alb_id" {
  value = aws_security_group.load_balancer.id
}

output "alb_id" {
  value = aws_lb.this.id
}
