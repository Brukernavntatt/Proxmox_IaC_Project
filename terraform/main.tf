module "proxmox_vm" {
  for_each = var.vms
  source   = "./module/proxmox_vm"

  vm_info = {
    node_name       = "mypve"
    name            = each.key
    vm_id           = each.value.vm_id
    keyboard_layout = "no"
    started         = false
    machine         = "q35"
  }

  memory      = each.value.memory
  cloud_image = each.value.cloud_image

  cpu = {
    sockets = each.value.cpu.sockets
    cores   = each.value.cpu.cores
    type    = each.value.cpu.type
  }

  disk = {
    size         = 20
    interface    = "scsi0"
    datastore_id = "local-lvm"
    discard      = "on"
    ssd          = true
  }

  user_account = {
    username         = each.value.username
    ssh_pub_key_path = each.value.ssh_pub_key_path
  }

  network_device = {
    vm_ip       = each.value.vm_ip
    bridge      = "vmbr0"
    model       = "virtio"
    gateway     = "192.168.50.1"
    dns_servers = ["192.168.50.29", "192.168.50.30"]
  }
}

