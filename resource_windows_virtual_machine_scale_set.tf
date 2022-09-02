# Create virtual machine
resource "azurerm_windows_virtual_machine_scale_set" "virtual_machine" {
  count = var.operating_system_platform == "Windows" ? 1 : 0

  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = var.size
  admin_username             = var.admin_username
  admin_password             = var.admin_password
  instances                  = var.instances
  license_type               = "Windows_Server"
  encryption_at_host_enabled = true
  overprovision              = false
  upgrade_mode               = "Manual"

  # Specify network ID
  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  # Specify the availability zones
  zone_balance = true
  zones        = ["1", "2", "3"]

  os_disk {
    caching              = "ReadOnly"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.disk_size_gb

    dynamic "diff_disk_settings" {
      for_each = var.ephemeral_disk_enabled == true ? [1] : []
      content {
        option    = "Local"
        placement = "CacheDisk"
      }
    }
  }

  # Specify a custom image (if not null)
  source_image_id = var.source_image_id

  # Use a standard image if a custom image is not provided
  dynamic "source_image_reference" {
    for_each = var.source_image_id == null ? [1] : []

    content {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = var.sku
      version   = "latest"
    }
  }

  automatic_instance_repair {
    enabled = true
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  tags = {
    environment = var.environment
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to instances, as autoscaling will take over
      instances,
    ]
  }
}
