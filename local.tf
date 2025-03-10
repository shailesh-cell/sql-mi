# Root-level locals.tf
locals {
  sku_name_aa = (var.environment == "prod") ? "Basic" : "Free"
}
