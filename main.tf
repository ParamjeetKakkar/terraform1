terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.40"
    }
    
  }
}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "rg" {
  name     = "${lookup(var.resource_group,var.env)}"
  location = "${lookup(var.location,var.env)}"
}


resource "azurerm_public_ip" "ip" {
  name                = "${lookup(var.ip_name,var.env)}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  allocation_method   = "${var.env == "prod" ? "Static" : "Dynamic"}"
  #allocation_method   = "${lookup(var.ip_con,var.env)}"
  tags = {
    environment = "${(var.env)}"
  }
}