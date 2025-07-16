include {
  path = find_in_parent_folders()
}

locals {
  env = "dev"

  default_tags = merge(include.locals.default_tags, {
    Environment = "dev"
  })
}
