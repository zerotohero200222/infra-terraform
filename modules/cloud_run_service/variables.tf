variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "service_account" {
  description = "Service account email for Cloud Run"
  type        = string
}

variable "allow_unauthenticated" {
  type    = bool
  default = false
}

variable "cpu" {
  type    = string
  default = null
}

variable "memory" {
  type    = string
  default = null
}

variable "min_instances" {
  type    = number
  default = null
}

variable "max_instances" {
  type    = number
  default = null
}

variable "env" {
  type    = map(string)
  default = {}
}

