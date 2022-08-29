####----Data Blocks----####
# data "azurerm_client_config" "current" {}

# data "azurerm_key_vault" "key_vault" {
#   name                = var.key_vault_name
#   resource_group_name = var.key_vault_resource_group_name
# }

# data "azurerm_key_vault_secret" "admin_username" {
#   name         = var.admin_username_secret_name
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }

# data "azurerm_key_vault_secret" "admin_password" {
#   name         = var.admin_password_secret_name
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = var.vnet_name
}
/* Defining the provider block of Terraform. Using "azurerm" providers for Azure.*/
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  # subscription_id = data.azurerm_client_config.current.subscription_id
  # tenant_id       = data.azurerm_client_config.current.tenant_id
  features {}
}

# module "network" {
#   source               = "./modules/network"
#   resource_group_name  = var.vnet_resource_group_name
#   subnet_address_space = var.subnet_address_space
#   region               = var.region
#   # vnet_address_space   = var.vnet_address_space
#   # route_table_name = var.route_table_name
#   subnet_name = var.subnet_name
#   vnet_name   = var.vnet_name
#   # subnet_id   = var.subnet_id
#   # nsg_name         = var.nsg_name
# }

module "managed-instance" {
  source                       = "./modules/managed-instance"
  resource_group_name          = var.resource_group_name
  region                       = var.region
  storage_size_in_gb           = var.storage_size_in_gb
  vcores                       = var.vcores
  sku_name                     = var.sku_name
  license_type                 = var.license_type
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  # administrator_login          = data.azurerm_key_vault_secret.admin_username.value
  # administrator_login_password = data.azurerm_key_vault_secret.admin_password.value
  sql_mi_name = var.sql_mi_name
  subnet_id   = data.azurerm_subnet.subnet.id
}

