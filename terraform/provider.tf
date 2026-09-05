terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.80"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pm_api_url
  api_token = "${var.pm_api_token_id}=${var.pm_api_token_secret}"
  insecure  = true

  # installs ssh key on pve host # 
  ssh {
    username    = "root"
    private_key = file("~/.ssh/proxmox-nøkkel")
  }
}