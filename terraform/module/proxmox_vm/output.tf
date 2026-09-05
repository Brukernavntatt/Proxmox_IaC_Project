output "vm_id" {
  value = proxmox_virtual_environment_vm.fedora.vm_id
}

output "vm_ip" {
  value = proxmox_virtual_environment_vm.fedora.initialization[0].ip_config[0].ipv4[0].address
}

output "username" {
  value = proxmox_virtual_environment_vm.fedora.initialization[0].user_account[0].username
}

output "ssh_pub_key_path" {
  value = var.user_account.ssh_pub_key_path
}

output "file_name" {
  value = proxmox_download_file.vm-download.file_name
  description = "Outputs which cloud-image is being used"
}