terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}


provider "proxmox" {
  pm_api_url = "https://192.168.1.10:8006/api2/json"
}


resource "proxmox_vm_qemu" "tfvm" {
  name        = "tf-vm"
  target_node = "mynet"

  clone = "template-suse"
  ### or for a PXE boot VM operation
  # pxe = true
  # boot = "scsi0;net0"
  # agent = 0
}
