locals {
  public_subnets = [
    for i, cidr in var.public_subnet_cidrs : {
      cidr_block        = cidr
      availability_zone = element(var.availability_zones, i % length(var.availability_zones))
    }
  ]

  private_subnets = [
    for i, cidr in var.private_subnet_cidrs : {
      cidr_block        = cidr
      availability_zone = element(var.availability_zones, i % length(var.availability_zones))
    }
  ]

  db_subnets = [
    for i, cidr in var.db_subnet_cidrs : {
      cidr_block        = cidr
      availability_zone = element(var.availability_zones, i % length(var.availability_zones))
    }
  ]
}

resource "aws_subnet" "public_subnet" {
  for_each = { for idx, subnet in local.public_subnets : subnet.cidr_block => subnet }
  vpc_id = var.vpc_id
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = true
  tags = {Name = "${var.app_name}-public-${each.value.availability_zone}-subnet" }
}

resource "aws_subnet" "private_subnet" {
  for_each = { for idx, subnet in local.private_subnets : subnet.cidr_block => subnet }
  vpc_id = var.vpc_id
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = false
  tags = {Name = "${var.app_name}-private-${each.value.availability_zone}-subnet" }
}

resource "aws_subnet" "db_subnet" {
  for_each = { for idx, subnet in local.db_subnets : subnet.cidr_block => subnet }
  vpc_id = var.vpc_id
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = false
  tags = {Name = "${var.app_name}-db-${each.value.availability_zone}-subnet" }
}
