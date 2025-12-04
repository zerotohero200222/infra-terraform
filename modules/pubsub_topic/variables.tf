variable "project_id" { type = string }
variable "topic_id"   { type = string }
variable "message_retention_duration" {
  type    = string
  default = "604800s"
}
variable "labels" {
  type    = map(string)
  default = {}
}
