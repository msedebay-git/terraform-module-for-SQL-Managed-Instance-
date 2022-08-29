resource "azurerm_mssql_managed_instance" "sql_mi" {
  name                = var.sql_mi_name
  resource_group_name = var.resource_group_name
  location            = var.region
  license_type       = var.license_type
  sku_name           = var.sku_name
  storage_size_in_gb = var.storage_size_in_gb
  subnet_id          = var.subnet_id
  vcores             = var.vcores
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

output "sql_mi_id" {
  value = azurerm_mssql_managed_instance.sql_mi.id
}
