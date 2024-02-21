variable "resource_group_name" {
    type = string
    default = null
}
variable "name" {
    type = string
    default = null
}
variable "location" {
    type = string
    default = null
}
variable "administrator_login_password" {
    type = string
    default = null
}
variable "coordinator_storage_quota_in_mb" {
    type = number
    default = 0
}
variable "coordinator_vcore_count" {
    type = number
    default = 0
}
variable "node_count" {
    type = number
    default = 0
}
variable "cosmosdb_postgresql_role_name" {
    type = string
}
