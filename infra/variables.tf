variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "database_name" {
  type        = string
  description = "Database name"
}

variable "administrator_login" {
  type        = string
  description = "Dabase administrator login"
}

variable "administrator_login_password" {
  type        = string
  description = "Database administrator password"
}