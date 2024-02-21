variable "resource_group_name" {
    type  = string
    default = null
}

variable "location" {
    type = string
    default = null
}

variable "virtual_network_name" {
  type = string
  default = null
}

variable "address_space" {
    type = list(string)
    default = null
}
variable "dns_servers" {
    type = list(string)
    default = null
}
variable "network_security_group_name" {
    type = string
    default = null
}
variable "subnet_name" {
    type = string
    default = null
}
variable "subnet_address_prefixes" {
    type = list(string)
    default = null
}
variable "subnet_id" {
  type = string


}

variable "security_rule" {
  type = list(object({
    name = string
    priority = number
    direction = string
    access = string
    protocol = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string

  }))
  default = null

}