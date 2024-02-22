variable "resource_group_name" {
    type = string
    default = null
}

variable "location" {
    type = string
    default = null
}

variable "service_plan" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    os_type             = string
    sku_name            = string
  })
}


variable "linux_web_app" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    service_plan_id     = string
    
    site_config = object({
        dotnet_version = number
  })  

})
}

