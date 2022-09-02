# Required resource variables
variable "name" {
  description = "Desired name of the scale set"
  type        = string
}

variable "source_image_id" {
  description = "The image ID for the provisioned resources"
  type        = string
  default     = null
}

variable "location" {
  description = "Desired location for the provisioned resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the provisioned resources"
  type        = string
}

variable "operating_system_platform" {
  description = "Desired OS for the provisioned resources"
  type        = string
}

variable "size" {
  description = "Desired size for the provisioned resources for each service"
  type        = string
}

variable "admin_username" {
  description = "Desired username for the provisioned resources"
  type        = string
}

variable "admin_password" {
  description = "Desired username for the provisioned resources"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet Id for scale set"
  type        = string
}

variable "disk_size_gb" {
  description = "Desired disk size for the provisioned resources"
  type        = string
}

variable "sku" {
  description = "Desired sku for the provisioned resources"
  type        = string
}

variable "environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
}

variable "instances" {
  description = "Number of instances of the provisioned resources"
  type        = string
  default     = 1
}

variable "ephemeral_disk_enabled" {
  description = "Whether to use a ephemeral OS disk the provisioned resources"
  type        = bool
  default     = false
}