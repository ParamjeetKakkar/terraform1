variable "resource_group" {
    type = "map"
    default = { dev = "dev_RG",
                prod = "prod_RG"
                }
}
variable "location" {
    type = "map"
    default = { dev = "westeurope",
            prod  = "northeurope"

    }
}

variable env {
    description = "env: dev or prod"
}

variable ip_name {
    type = "map"
    default = {dev = "dev_public321",
               prod = "prod_public321"
    }
}

variable ip_con {
    type = "map"
    default = {
        dev = "Dynamic"
        prod = "Static"

    }
}