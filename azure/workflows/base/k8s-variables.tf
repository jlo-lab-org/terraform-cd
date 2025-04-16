variable "publisher_name" {
  default     = "Ivan Hidalgo"
  description = "The name of the owner of the service"
  type        = string
  validation {
    condition     = length(var.publisher_name) > 0
    error_message = "The publisher_name must contain at least one character."
  }
}

variable "publisher_email" {
  default     = "ivan.hidalgo@rockwellautomation.com"
  description = "The email address of the owner of the service"
  type        = string
  validation {
    condition     = length(var.publisher_email) > 0
    error_message = "The publisher_email must contain at least one character."
  }
}

variable "k8s-prefix" {
  description = "lab"
  default     = "test"
}