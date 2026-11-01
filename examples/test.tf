module "naming" {
  source       = "../"
  environment  = "Dev"
  project_code = "ALP"
  region       = "west europe"
}

output "example_resource_group" {
  value = "xyz-${module.naming.convention["resource_group"]}"
}

output "example_vnet" {
  value = "abc-${module.naming.convention["virtual_network"]}"
}

output "example_storage_account" {
  value = "123${module.naming.convention["storage_account"]}"
}

output "landing_zone_resource_group" {
  value = module.naming.landing_zone["resource_group"]
}

output "landing_zone_virtual_network" {
  value = module.naming.landing_zone["virtual_network"]
}

module "naming_upper" {
  source       = "../"
  environment  = "DEV"
  project_code = "WHS"
  region       = "westeurope"
}

output "example_resource_group_upper" {
  value = upper("xyz-${module.naming_upper.convention["resource_group"]}")
}

output "example_vnet_upper" {
  value = upper("abc-${module.naming_upper.convention["virtual_network"]}")
}

output "env_short_code" {
  value = module.naming.environment_short_code
}

output "region_short_code" {
  value = module.naming.region_short_code
}

output "cosmos" {
  value = "test-${module.naming.convention["cosmos_db_account"]}"
}