# Get information about the Ubuntu template VM from Proxmox
data "proxmox_vm" "ubuntu_template" {
  id        = var.ubuntu_template_vm_id
  node_name = var.proxmox_node_name
}

resource "proxmox_virtual_environment_cloned_vm" "test_vm" {
  node_name = var.proxmox_node_name
  name      = "test-vm"

  clone {
    vm_id = data.proxmox_vm.ubuntu_template.id
    full  = true
  }

  cpu {
    cores   = 2
    sockets = 1
  }

  memory {
    size = 2048
  }
}
