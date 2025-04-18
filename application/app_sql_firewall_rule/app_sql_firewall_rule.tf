resource "azurerm_mssql_firewall_rule" "db_firewall_rule" {
  name             = var.firewall_rule_name
  server_id        = var.server_id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}