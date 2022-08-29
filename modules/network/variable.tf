variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

# variable "nsg_name" {
#   type        = string
#   description = "Name of the Network Security Group"
#   default     = "nsg-sqlmi"
# }

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

# variable "subnet_id" {
#   type        = number
#   description = "subnet ID of the vnet"
# }

# variable "route_table_name" {
#   type        = string
#   description = "Name of the Route Table"
#   default = ""
# }

# variable "vnet_address_space" {
#   type        = list(string)
#   description = "Vnet Address Space" 
# }

variable "subnet_address_space" {
  type        = string
  description = "subnet address space"
}

variable "region" {
  type        = string
  description = "Region of the network"
}