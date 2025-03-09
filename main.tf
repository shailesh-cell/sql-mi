module "resource_group" {
  source      = "./modules/resource_group"
  product     = var.product
  environment = var.environment
  location    = var.location
}