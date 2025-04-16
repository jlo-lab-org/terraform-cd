variable "mysql_server_name" {
  description = "Name of the Azure MySQL Flexible server"
  type        = string
  default     = "mysql-server"

}
variable "mysql_server_name_suffix" {
  description = "Random suffix for the MySQL server name"
  type        = string
  default     = "mysql-server-suffix"
}
variable "mysql_admin_username" {
  description = "MySQL administrator username"
  type        = string
  default     = "mysqladmin"
}
variable "mysql_admin_password" {
  description = "MySQL administrator password"
  type        = string
  default     = "P@ssw0rd1234!"
}
variable "mysql_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0.21"
}
variable "sku_name" {
  description = "MySQL server SKU name"
  type        = string
  default     = "B_Standard_B1s"
}
variable "database_name" {
  description = "Name of the MySQL database"
  type        = string
  default     = "products"

}