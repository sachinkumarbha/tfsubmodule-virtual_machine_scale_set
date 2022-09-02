output "virtual_machine_id" {
  value = module.virtual_machine_scale_set[*].id
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "network_name" {
  value = module.service_network.network_name
}