locals {
  tags = {
    Project   = "Medcloud project"
    CreatedAt = "${timestamp()}"
    Owner     = "Alexandre Rosas Costa"
  }
}