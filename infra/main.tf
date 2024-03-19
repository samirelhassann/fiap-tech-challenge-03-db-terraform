data "azurerm_resource_group" "aks_rg" {
  name = var.resource_group_name
}

resource "azurerm_postgresql_server" "postgres" {
  name                         = "${var.resource_group_name}-postgres"
  location                     = data.azurerm_resource_group.aks_rg.location
  resource_group_name          = data.azurerm_resource_group.aks_rg.name
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  sku_name                     = "B_Gen5_1"
  storage_mb                   = 5120
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false
  version                      = "11"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "postgres_db" {
  name                = var.database_name
  resource_group_name = data.azurerm_resource_group.aks_rg.name
  server_name         = azurerm_postgresql_server.postgres.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "firewall" {
  name                = "${var.resource_group_name}-firewall"
  resource_group_name = data.azurerm_resource_group.aks_rg.name
  server_name         = azurerm_postgresql_server.postgres.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
