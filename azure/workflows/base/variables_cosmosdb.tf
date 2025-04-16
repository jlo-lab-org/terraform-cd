variable "mongo_database_name" {
  description = "Name of the MongoDB database"
  type        = string
  default     = "orders"

}

variable "database_throughput" {
  description = "Throughput for the MongoDB database"
  type        = number
  default     = 400

}