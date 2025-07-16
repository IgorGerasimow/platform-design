terraform {
  source = "../terraform"
}

inputs = {
  region                 = "us-east-1"
  name                   = "platform"
  cluster_name           = "platform-eks"
  enable_hetzner_nodes   = true
  hetzner_token          = get_env("HCLOUD_TOKEN", "")
  hetzner_node_count     = 2
  hetzner_server_type    = "cx31"
  hetzner_image          = "ubuntu-22.04"
  hetzner_location       = "fsn1"
}
