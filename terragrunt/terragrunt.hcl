locals {
  region      = "us-east-1"
  environment = "dev"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-states"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOT
    provider "aws" {
      region = "${local.region}"
    }
  EOT
}
