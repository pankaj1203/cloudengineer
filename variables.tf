variable "client_id" {
    type = string
    default = null
  
}

variable "client_secret" {
  type = string
    default = null
}
variable "tenant_id" {
  type = string
    default = null
}

variable "subscription_id" {
  type = string
  default = "9229e7d9-5723-4406-943c-a0b864598b61"
  
}

variable "location" {
  type = string
  default = "West Europe"
  
}

variable "address_space" {
  type = list(string)
  default = ["10.0.0.0/22"]
  
}