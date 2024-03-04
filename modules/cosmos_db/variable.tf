variable "cosmosdb_account_name" {
    type = string
    default = null
}

variable "location" {
    type = string
    default = null
}

variable "resource_group_name" {
    type = string
    default = null
}

variable "offer_type" {
    type = string
    default = null
}

variable "kind" {
    type = string
    default = null
}


variable "capabilities" {
    type = object({
        name = string
    })
    default = null
}

variable "consistency_policy" {
    type = object({
        consistency_level = string
    })
    default = null
}

variable "geo_location" {
    type = object({
        location = string
        failover_priority = number
    })
    default = null
}

variable "cosmos_mongo_database_name" {
    type = string
    default = null
}

variable "account_name" {
    type = string
    default = null
}

variable "cosmos_mongo_database_id" {
    type = string
    default = null
}

variable "username" {
    type = string
    default = null
}

variable "password" {
    type = string
    default = null
}