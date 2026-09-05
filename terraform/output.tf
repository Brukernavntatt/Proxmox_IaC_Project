output "vm_info" {
  value = {
    for name, instance in module.proxmox_vm : name => {
      vm_id            = instance.vm_id
      vm_ip            = instance.vm_ip
      username         = instance.username
      ssh_pub_key_path = instance.ssh_pub_key_path
      file_name        = instance.file_name
    }
  }
}