# Calculate local variables
locals {

  # Service functions and concatenations
  service_location_prefix    = replace(var.service_location, "/[a-z[:space:]]/", "")
  service_environment_prefix = substr(var.service_environment, 0, 1)

  # Resource functions and concatenations
  resource_name          = "${local.service_environment_prefix}-${local.service_location_prefix}-${var.resource_name}"
  resource_instance_size = lookup(lookup(var.resource_instance_size, "Test", null), var.service_name, null)
}
