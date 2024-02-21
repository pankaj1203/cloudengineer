variable "resource_group_name" {
    type = string
    default = null
}

variable "location" {
    type = string
    default = null
}

variable "app_service_plan_name" {
    type = string
    default = null
}

variable "sku" {
    type = object({
        tier = string
        size = string
    })
}

variable "app_service_name" {
    type = string
    default = null
}

variable "app_service_plan_id" {
    type = string
    default = null
}

variable "site_config" {
    type = object({
        dotnet_framework_version = string
        scm_type = string
    })
    default = null
}


variable "connection_string" {
    type = object({
        name = string
        type = string
        value = string
    })
    default = null
}

