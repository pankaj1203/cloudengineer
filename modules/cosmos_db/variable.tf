variable "resource_group_name" {
    type = string
    default = null
}

variable "cosmosdb" {
    type = string
    default = null
}

variable "location" {
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

variable "enable_automatic_failover" {
    type = bool
    default = null
}

variable "consistency_policy" {
    type = object({
    consistency_level       = string
    max_interval_in_seconds = number
    max_staleness_prefix    = number
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