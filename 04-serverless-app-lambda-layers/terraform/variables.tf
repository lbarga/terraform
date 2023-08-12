variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "terraform"
}

variable "service_name" {
  type        = string
  description = ""
  default     = "todo"
}

variable "service_domain" {
  type        = string
  description = ""
  default     = "api-todo"
}
