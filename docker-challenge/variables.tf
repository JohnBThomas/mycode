# internal_port = 9876
# external_port = 5432
# container_name = "Alta3ResearchWebService"

variable "internal_port" {
  description = "internal port used 9876"
  default = 9876
}

variable "external_port" {
  description = "external port used 9876"
  default = 5432
}

variable "container_name" {
  description = "Docker name"
  default = "Alta3ResearchWebService"
}
