terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.11.0, < 4.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  tenant_id       = "your-tenant-id"
  client_id       = "your-client-id"
  client_secret   = var.AZURE_CLIENT_SECRET
  subscription_id = "your-subscription-id"
}

resource "azurerm_resource_group" "terraform_azure_provider" {
  name     = "terraform_azure_provider"
  location = "East US"
}

module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.terraform_azure_provider.name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linsimplevmips-unique-name"] # Make sure it's unique
  vnet_subnet_id      = module.network.vnet_subnets[0]
  vm_size             = "Standard_B21s"

  depends_on = [azurerm_resource_group.terraform_azure_provider]
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.terraform_azure_provider.name
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  depends_on = [azurerm_resource_group.terraform_azure_provider]
}

output "linux_vm_public_name" {
  value = module.linuxservers.public_ip_dns_name
}
