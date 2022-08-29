variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "region" {
  type        = string
  description = "Region of the SQLMI"
}

variable "sql_mi_name" {
  type        = string
  description = "Name of the SQL Managed Instance. This needs to be globally unique within Azure."
}

variable "administrator_login" {
  type        = string
  description = "Name of Administrator login user"
}

variable "administrator_login_password" {
  type        = string
  description = "Administrator Login Password"
}

variable "license_type" {
  type        = string
  description = "Managed Instance License Type. LicenseIncluded or BasePrice."
}

variable "sku_name" {
  type        = string
  description = "Managed Instance SKU Name (GP_Gen4, GP_Gen5, BC_Gen4, BC_Gen5)"
}

variable "vcores" {
  type        = number
  description = "Managed Instance vcores. Values can be 8, 16, or 24 if sku_name is GP_Gen4, or 8, 16, 24, 32, or 40 if sku_name is GP_Gen5"
}

variable "storage_size_in_gb" {
  type        = number
  description = "Storage size in GB. Should be multiple of 32"
}

variable "subnet_id" {
  type = string
}
