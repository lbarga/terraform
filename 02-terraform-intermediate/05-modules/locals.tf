resource "random_pet" "r_pet" {
  length = 5
}

locals {
  random_pet = random_pet.r_pet.id
}
