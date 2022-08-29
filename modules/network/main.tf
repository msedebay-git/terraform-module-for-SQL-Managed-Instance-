# data "azurerm_network_security_group" "nsg" {
#   name = var.nsg_name
#   location = var.location
#   resource_group_name = var.resource_group_name
# }

#Create NSG Rules
# resource "azurerm_network_security_rule" "allow_management_inbound" {
#   name                        = "allow_management_inbound"
#   priority                    = 106
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_ranges     = ["9000", "9003", "1438", "1440", "1452"]
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "allow_misubnet_inbound" {
#   name                        = "allow_misubnet_inbound"
#   priority                    = 200
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = var.subnet_address_space
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "allow_health_probe_inbound" {
#   name                        = "allow_health_probe_inbound"
#   priority                    = 300
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "AzureLoadBalancer"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "allow_tds_inbound" {
#   name                        = "allow_tds_inbound"
#   priority                    = 1000
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "1433"
#   source_address_prefix       = "VirtualNetwork"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "deny_all_inbound" {
#   name                        = "deny_all_inbound"
#   priority                    = 4096
#   direction                   = "Inbound"
#   access                      = "Deny"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "allow_management_outbound" {
#   name                        = "allow_management_outbound"
#   priority                    = 102
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_ranges     = ["80", "443", "12000"]
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "allow_misubnet_outbound" {
#   name                        = "allow_misubnet_outbound"
#   priority                    = 200
#   direction                   = "Outbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = var.subnet_address_space
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_network_security_rule" "deny_all_outbound" {
#   name                        = "deny_all_outbound"
#   priority                    = 4096
#   direction                   = "Outbound"
#   access                      = "Deny"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_virtual_network" "vnet" {
#   name                = var.vnet_name
#   resource_group_name = var.resource_group_name
#   address_space       = [var.vnet_address_space] # ["10.0.0.0/16"]
#   location            = var.location
# }

data "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = var.resource_group_name
}

# resource "azurerm_subnet" "subnet" {
#   name                 = var.subnet_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = [var.subnet_address_space] #["10.0.0.0/24"]

#   delegation {
#     name = "managedinstancedelegation"

#     service_delegation {
#       name    = "Microsoft.Sql/managedInstances"
#       actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
#     }
#   }
# }

data "azurerm_subnet" "subnet" {
  name = var.subnet_name
  virtual_network_name = var.azurerm_virtual_network.vnet_name
  resource_group_name = var.resource_group_name     
}

# resource "azurerm_subnet_network_security_group_association" "nsg_association" {
#   subnet_id                 = data.azurerm_subnet.subnet.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

#Route Table creation
# resource "azurerm_route_table" "route_table" {
#   name                          = var.route_table_name
#   location                      = var.location
#   resource_group_name           = var.resource_group_name
#   disable_bgp_route_propagation = false
#   depends_on = [
#     azurerm_subnet.subnet,
#   ]
# }

# data "azurerm_route_table" "route_table" {
#   name = var.route_table_name
#   location = var.location
#   resource_group_name = var.resource_group_name
#   disable_bgp_route_propagation = false
#   depends_on = [
#     data.azurerm_subnet.subnet
#   ]
# }
#Route Table association
# resource "azurerm_subnet_route_table_association" "route_table_association" {
#   subnet_id      = azurerm_subnet.subnet.id
#   route_table_id = azurerm_route_table.route_table.id
# }

# output "subnet_id" {
#   value = azurerm_subnet.subnet.id
# }