terraform {
  backend "azurerm" {
    resource_group_name   = "fiap-tech-challenge-03"
    storage_account_name  = "fiaptechchall03sa"
    container_name        = "fiaptechchallenge03tfstatedatabase"
    key                   = "fiap-tech-challenge-03-db.tfstate"
  }
}
