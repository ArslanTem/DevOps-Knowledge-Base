variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  default     = "tr-storage-rg"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "trstoracc123"
}
