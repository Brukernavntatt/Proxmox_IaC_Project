resource "proxmox_download_file" "vm-download" {
  node_name    = var.vm_info.node_name
  content_type = var.cloud_image.content_type
  datastore_id = var.cloud_image.datastore_id
  url          = var.cloud_image.url
  file_name    = var.cloud_image.file_name
}

resource "proxmox_virtual_environment_vm" "fedora" {
  
  # vm_info # 
  name            = var.vm_info.name
  node_name       = var.vm_info.node_name
  vm_id           = var.vm_info.vm_id
  keyboard_layout = var.vm_info.keyboard_layout
  started         = var.vm_info.started
  boot_order      = var.vm_info.boot_order
  machine         = var.vm_info.machine
  agent { enabled = var.vm_info.agent }

  # vm_hardware #
  disk {
    datastore_id = var.disk.datastore_id
    interface    = var.disk.interface
    size         = var.disk.size
    ssd          = var.disk.ssd
    discard      = var.disk.discard
    file_id      = proxmox_download_file.vm-download.id
  }

  memory {
    dedicated = var.memory
  }

  cpu {
    sockets = var.cpu.sockets
    cores   = var.cpu.cores
    type    = var.cpu.type
  }

  # networking and user_accounts #
  network_device {
    bridge = var.network_device.bridge
    model  = var.network_device.model

  }

  initialization {
    ip_config {
      ipv4 {
        address = var.network_device.vm_ip
        gateway = var.network_device.gateway
      }
    }

    user_account {
      username = var.user_account.username
      keys     = [file(pathexpand(var.user_account.ssh_pub_key_path))]
    }

    dns {
      servers = var.network_device.dns_servers
    }
  }
}


