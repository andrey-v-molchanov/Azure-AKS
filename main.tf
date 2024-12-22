resource "azurerm_resource_group" "aks_rg" {
  name     = "my-aks-poc-rg"
  #location = "West Europe"
  location =  "westus"
}

resource "azurerm_kubernetes_cluster" "aks01" {
  name                = "aks01"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "dns-aks1-prefix"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Proof-of-Concept"
  }
}

