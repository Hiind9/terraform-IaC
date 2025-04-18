resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.username
  administrator_login_password = var.password

}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  
  server_id = azurerm_mssql_server.sql_server.id

  license_type = var.license_type

  max_size_gb = var.dbsize

  sku_name = var.sku_name

  collation = var.collation

  zone_redundant = var.zone_redundant

  geo_backup_enabled = var.geo_backup_enabled

  storage_account_type = var.storage_account_type

  
}