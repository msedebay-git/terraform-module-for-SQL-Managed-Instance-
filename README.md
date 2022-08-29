# terraform-azurerm-sqlmi
The terraform script is used to provision the SQL Managed Instance along with the required network resouces to comply with [networking requirements](https://docs.microsoft.com/azure/sql-database/sql-database-managed-instance-vnet-configuration#requirements).

There are three child modules which are used for the SQL Managed Instance provisioning. Below are the details of the child modules:

    - resource-group
    - network
    - managed-instance
    
## Deployment duration
SQL Managed Instance deployment can take up to 4 plus hours [deployment durations](https://docs.microsoft.com/azure/sql-database/sql-database-managed-instance-vnet-configuration#durations).
    
## Before you begin

To run this sample, you need the following prerequisites.

**Software prerequisites:**

1. The Azure CLI
2. The Terraform CLI  

**Terraform Commands:**

1. Terraform init - Will ensure that terraform has downloaded all necessary providers and modules by initilizing it.
2. Terraform plan - Show changes required by the current configuration.
3. Terraform fmt - Rewrites Terraform configuration files to a canonical format and style, so you don't have to waste time making minor adjustments for readability and consistency.
4. Terraform apply - Create or update infrastructure.
5. Terraform destroy - Destroy previously-createdinfrastructure.
    
## Virtual Network Parameters

Below are the parameters required for the network module:

    - resource_group_name
    - location
    - nsg_name
    - vnet_name
    - subnet_name
    - route_table_name
    - subnet_address_space

Managed-Instance :

This module will create the SQL Managed Instance.

## SQL Managed Instance Parameters

Below are the required parameters for Managed Instance:
    - resource_group_name
    - location
    - sql_mi_name
    - administrator_login
    - administrator_login_password

Below are the optional paramters for Managed instance:

    - license_type
    - sku_name
    - vcores
    - storage_size_in_gb

## Output

After completion of the script the SQL Managed ID will be printed in the output.
