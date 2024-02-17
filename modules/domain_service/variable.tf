variable "domain_service_name" {
    type = string
    default = null
}

variable "location" {
    type = string
default = "West Europe"
}
variable "resource_group_name" {
    type = string
    default = null
}

variable "domain_name" {
    type = string
}
variable "sku" {
    type = string
}
variable "filtered_sync_enabled" {
    type = bool
    default = null
}

variable "initial_replica_set" {
type = object({
    subnet_id = string
})
default = null
}
variable "notifications" {
    type = object({
        additional_recipients = list(string)
        notify_dc_admins = bool
        notify_global_admins = bool
    })
    default = null
}
variable "security" {
    type = object({
        sync_kerberos_passwords = bool
        sync_ntlm_passwords = bool
        sync_on_prem_passwords = bool
    })
    default = null
}

