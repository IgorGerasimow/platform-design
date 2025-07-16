include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../terraform/modules/vpc"
}

inputs = {
  name     = "${include.local.env}-platform"
  vpc_cidr = "10.0.0.0/16"
  tags = merge(include.local.default_tags, {
    ManagedBy = "terragrunt"
  })
}
