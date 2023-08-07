locals {
  instance_number = lookup(var.instance_number, var.env)

  file_ext    = "zip"
  object_name = "my-file-generated-from-template"

  common_tags = {
    Owner     = "lmpb"
    Year      = "2023"
    ManagedBy = "terraform"
  }
}
