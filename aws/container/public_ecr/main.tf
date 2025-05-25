provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "this" {
  provider        = aws.us_east_1

  repository_name = "${var.prefix}/${var.repository_name}"

  catalog_data {
    about_text        = var.about_text
    architectures     = ["ARM 64", "AMD 64"]
    description       = var.description
    logo_image_blob   = var.logo_image_blob == "" ? var.logo_image_blob : null
    operating_systems = ["Linux"]
    usage_text        = var.usage_text
  }
}
