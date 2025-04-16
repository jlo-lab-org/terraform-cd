terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-labs"
    storage_account_name = "tfstatelabactions"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    subscription_id      = "44e49970-899b-4abc-aaf8-322b3e531fbe"

  }
}