variable "location" {
  description = "Region where resources will be deployed"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Environment name (e.g test, dev, prod)"
  type = string
  
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}


variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "key_vault_resource_group" {
  description = "Resource group of the Azure Key Vault"
  type        = string
}