output "public_ip" {

  value = [for instance in module.virtual_machine : instance.virtual_machine.public_ip_address]

}
