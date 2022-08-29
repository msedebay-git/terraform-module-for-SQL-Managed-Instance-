variable "resource_group_name" {
  type        = string
  description = "Name of the SQLMI resource group"
  default     = ""
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Name of the vnet resource group"
  default     = ""
}

variable "key_vault_resource_group_name" {
  type        = string
  description = "Name of the key vault resource group"
  default     = ""
}

variable "region" {
  type        = string
  description = "Region of the SQLMI"
  default     = "eastus"
}

# variable "nsg_name" {
#   type        = string
#   description = "Name of the Network Security Group"
#   default     = ""
# }

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default     = ""
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default     = ""
}

variable "subnet_id" {
  type        = number
  description = "subnet ID of the vnet"
  default     = 1
}

variable "subnet_address_space" {
  description = "The address prefix to use for the subnet."
  type        = string
  default     = ""
}

variable "vnet_address_space" {
  type        = string
  description = "The address space that is used by the virtual network."
  default     = ""
}

# variable "route_table_name" {
#   type        = string
#   description = "Name of the Route Table"
# }

variable "sql_mi_name" {
  type        = string
  description = "Name of the SQL Managed Instance. This needs to be globally unique within Azure."
  default     = ""
}

# variable "key_vault_name" {
#   type        = string
#   description = "Key vault name that holds admin username and password"
#   default = "pm-sqlmi-dev-kv"
# }

# variable "admin_username_secret_name" {
#   type        = string
#   description = "Key vault secret name that holds the admin username"
#   default = "admin-username"
# }

variable "administrator_login" {
  type        = string
  description = "Name of Administrator login user"
  default     = "sqlmiadmin"
}

variable "administrator_login_password" {
  type        = string
  description = "Administrator Login Password"
  default     = ""
}

variable "admin_password_secret_name" {
  type        = string
  description = "Key vault secret name that holds the admin password"
  default     = "admin-password"
}

variable "license_type" {
  type        = string
  description = "Managed Instance License Type. LicenseIncluded or BasePrice."
  default     = "BasePrice"
}

variable "sku_name" {
  type        = string
  description = "Managed Instance SKU Name (GP_Gen4, GP_Gen5, BC_Gen4, BC_Gen5)"
  default     = "GP_Gen5"
}

variable "vcores" {
  type        = number
  description = "Managed Instance vcores. Values can be 8, 16, or 24 if sku_name is GP_Gen4, or 8, 16, 24, 32, or 40 if sku_name is GP_Gen5"
  default     = "4"
}

variable "storage_size_in_gb" {
  type        = number
  description = "Storage size in GB. Should be multiple of 32"
  default     = "512"
}

