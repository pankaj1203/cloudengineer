variable "storage_account_name" {
    type = string
    default = null
}
variable "resource_group_name" {
    type = string
    default = null
}
variable "location" {
    type = string
    default = null
}
variable "account_tier" {
    type = string
    default = null
}
variable "account_replication_type" {
    type = string
    default = null
}
variable "identity" {
    type = object({
        type = string
    })
    default = null
}


variable "blob_properties" {
    type = object({
        versioning_enabled = bool
        delete_retention_policy = object({
            days = number
        }
        )
        container_delete_retention_policy = object ({
            days = number
        }
        )
        cors_rule = object({
            allowed_headers = list(string)
            allowed_methods = list(string)
            allowed_origins = list(string)
            exposed_headers = list(string)
            max_age_in_seconds = number
        })

    }
    )

    }



