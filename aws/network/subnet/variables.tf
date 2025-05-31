variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "app_name" {
  description = "The application name used for tagging"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "db_subnet_cidrs" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
}