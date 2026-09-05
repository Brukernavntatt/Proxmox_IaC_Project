# --- Proxmox Connect --- #
variable "pm_api_url" {
  type = string
}
variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

# --- VM Variables --- # 
variable "vms" {
  type = map(object({
    vm_id            = number
    vm_ip            = string
    username         = optional(string, "dani")
    ssh_pub_key_path = optional(string, "~/.ssh/proxmox-nøkkel.pub")

    cloud_image = optional(object({
      url          = optional(string, "https://download.fedoraproject.org/pub/fedora/linux/releases/44/Cloud/x86_64/images/Fedora-Cloud-Base-Generic-44-1.7.x86_64.qcow2")
      file_name    = optional(string, "fedora-cloud-44.img")
      content_type = optional(string, "iso")
      datastore_id = optional(string, "ProxBackups")
    }), {})

    memory = optional(number, 2048)

    cpu = optional(object({
      sockets = optional(number, 1)
      cores   = optional(number, 2)
      type    = optional(string, "host")
    }), {})
  }))
}



