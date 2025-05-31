variable "repository_name" {
  description = "repository name"
  type = string
}

variable "prefix" {
  description = "prefix"
  type = string
}

variable "about_text" {
  description = "text"
  type = string
  default = "default"
}

variable "description" {
  description = "description"
  type = string
  default = "default"
}

variable "logo_image_blob" {
  description = "log image blob"
  type = string
  default = "default"
}

variable "usage_text" {
  description = "usage text"
  type = string
  default = "default"
}