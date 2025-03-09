terraform {
  backend "azurerm" {
    resource_group_name   = "terraform_tfstate_rg"
    storage_account_name  = "terraformconfigsa"
    container_name        = "tfstate"
    key                   = "dbuh/terraform.tfstate"
  }
}
