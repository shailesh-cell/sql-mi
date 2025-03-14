# resource_group/variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  type    = string
  default = "wus2"
  validation {
    condition     = contains(["cin", "cus", "wus2"], var.location)
    error_message = "Allowed values: cin, cus, wus2."
  }
}

# Map short codes to full region names
locals {
  location_map = {
    cin = "centralindia"
    cus = "centralus"
    wus2 = "West US 2" 
  }
}

# Use the full region name in resource definitions
output "full_location" {
  value = lookup(local.location_map, var.location, "centralindia")
}