locals {
  bucket_name = random_pet.site.id
  src         = "../${path.root}/website/build"
  mime_types  = jsondecode(file("./mime.json"))

  common_tags = {
    Project   = "Terraform Course"
    Service   = "Static Website"
    CreatedAt = timestamp()
    Module    = "3"
  }
}
