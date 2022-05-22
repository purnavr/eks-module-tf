resource "aws_ec2_tag" "private-subnets" {
  count = length(var.PRIVATE_SUBNET_IDS)
  resource_id = element(var.PRIVATE_SUBNET_IDS, count.index)
  key         = "ONE"
  value       = "Hello World"
}
