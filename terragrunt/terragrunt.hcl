locals {
  region      = "us-east-1"
  environment = "dev"
  owner       = ""
  ticket      = ""
  service     = ""

  tag_values = {
    Environment = local.environment
    Owner       = local.owner
    Ticket      = local.ticket
    Service     = local.service
  }

  default_tags = { for k, v in local.tag_values : k => v if v != "" }
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
      default_tags {
        tags = {
          %{ for k, v in local.default_tags ~}
          ${k} = "${v}"
          %{ endfor ~}
        }
      }
    }
  EOT
}
