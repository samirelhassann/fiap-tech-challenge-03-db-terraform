data "azurerm_storage_account" "sa" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.aks_rg.name
}

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_account_container_name
  storage_account_name  = data.azurerm_storage_account.sa.name
  container_access_type = "private"
}
