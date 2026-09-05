variable "vm_info" {
  type = object({
    name            = string
    node_name       = string
    vm_id           = number
    keyboard_layout = string
    started         = bool
    machine         = string
    boot_order      = optional(list(string), ["scsi0","net0"])
    agent           = optional(bool, false)
  })
}

variable "cloud_image" {
  type = object({
    url          = string
    file_name    = string
    datastore_id = string
    content_type = string
  })
}

variable "disk" {
  type = object({
    datastore_id = string
    interface    = string
    size         = number
    ssd          = bool
    discard      = string
  })
}

variable "memory" {
  type = number
}

variable "cpu" {
  type = object({
    sockets = number
    cores   = number
    type    = string
  })
}

variable "network_device" {
  type = object({
    bridge      = string
    model       = string
    vm_ip       = string
    gateway     = string
    dns_servers = list(string)
  })
}

variable "user_account" {
  type = object({
    username         = string
    ssh_pub_key_path = string
  })
}