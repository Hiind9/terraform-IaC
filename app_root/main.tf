module "rg" {

  source = "../application/app_resource_group"

  name = "${local.prefix}-rg"

  location = "uae north" #put your prefered region 

}

module "vnet" {

  source = "../application/app_virtual_network"

  name = "${local.prefix}-vnet"

  location = module.rg.resource_group.location

  resource_group_name = module.rg.resource_group.name

  address_space = ["10.0.0.0/16"]

}

module "subnet" {

  source = "../application/app_subnets"

  for_each = local.subnets

  name = each.key

  vnet_name = module.vnet.virtual_network.name

  resource_group_name = module.rg.resource_group.name

  address_prefixes = each.value.address_prefixes


}

module "nsg" {

  source = "../application/app_nsg"

  nsg_name = "${local.prefix}-nsg"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location



}

module "nsg_rule" {

  source = "../application/app_nsg_rule"

  for_each = local.nsg_rule

  name                       = each.key
  priority                   = each.value.priority
  direction                  = each.value.direction
  access                     = each.value.access
  protocol                   = each.value.protocol
  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  resource_group_name = module.rg.resource_group.name

  network_security_group_name = module.nsg.network_security_group.name
}

module "public_ip" {

  for_each = local.public_ips

  source = "../application/app_public_ip"

  sku = "Basic"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  ip_allocation_method = each.value.allocation_method

  public_ip_address_name = each.key

}

module "nics" {

  for_each = local.nics

  source = "../application/app_nic"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  ip_configuration_name = each.value.ip_configuration_name

  nic_name = each.key

  subnet_id = module.subnet[each.value.subnet].subnet.id

  network_security_group_id = module.nsg.network_security_group.id

  public_ip_address_id = module.public_ip[each.value.public_ip].public_ip.id

}

module "sql_db" {

  source = "../application/app_sql_db"

  // Create a Server

  collation = "SQL_Latin1_General_CP1_CI_AS"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  username = "azureuser" #default name, you can use your name

  password = "Hind-1231234" #use a strong password

  server_name = "${local.prefix}-sql"

  server_version = "12.0"

  dbsize = 1

  zone_redundant = false

  // Create a Database

  sql_database_name = "${local.prefix}-db"

  sku_name = "Basic"

  storage_account_type = "Local"


}

module "virtual_machine" {

  for_each = local.virtual_machine

  source = "../application/app_vms"

  vm_name = "${local.prefix}-${each.key}"

  resource_group_name = module.rg.resource_group.name

  location = module.rg.resource_group.location

  computer_name = each.key

  vm_size = "Standard_D2s_v3"

  username = "azureuser" #default name, you can use your name

  nic_id = module.nics[each.value.nic].nic.id

  public_key = tls_private_key.ssh_key.public_key_openssh



}

module "sql_firewall_rule" {

  source = "../application/app_sql_firewall_rule"

  firewall_rule_name = "enable-backend-comm"

  server_id = module.sql_db.sql_server.id

  start_ip_address = try(module.public_ip["backend_ip"].public_ip.public_ip_address, "0.0.0.0")

  end_ip_address = try(module.public_ip["backend_ip"].public_ip.public_ip_address, "0.0.0.0")
  depends_on     = [module.public_ip]
}
