output "vpc_id" {
    value = aws_vpc.main_vpc.id  
}

  
output "subnet_id" {
    value = local.subnet_ids
}