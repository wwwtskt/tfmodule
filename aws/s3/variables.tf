variable "bucket_name" {
  description = "bucket name"
  type = string
}

variable "versioning_configuration" {
  description = "use versioning"
  type = string
  default = "Disabled"
}

variable "block_public_acls" {
  description = "block public acls"
  type = bool
  default = true
}

variable "block_public_policy" {
  description = "block public policy "
  type = bool
  default = true
}

variable "ignore_public_acls" {
  description = "ignore public acls"
  type = bool
  default = true
}

variable "restrict_public_buckets" {
  description = "restrict public buckets"
  type = bool
  default = true
}

variable "bucket_policy" {
  description = "bucket policy statement"
  type = string
  default = null
}