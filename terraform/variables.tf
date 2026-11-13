variable "proxmox_endpoint" {
  description = "The Proxmox API endpoint URL."
  type        = string
}

variable "proxmox_username" {
  description = "The Proxmox API username."
  type        = string
}

variable "proxmox_password" {
  description = "The Proxmox API password."
  type        = string
  sensitive   = true
}

variable "proxmox_api_token" {
  description = "The Proxmox API token."
  type        = string
  sensitive   = true
}

variable "proxmox_node_name" {
  description = "The name of the Proxmox node where the VM is located."
  type        = string
}

variable "ubuntu_template_vm_id" {
  description = "The ID of the Ubuntu template VM in Proxmox."
  type        = string
}
