variable "google_project" {
  type    = string
  default = "brentsmith-info"
}

variable "dns_suffix" {
  type    = string
  default = "brentsmith.info"
}

variable "zone_name" {
  type    = string
  default = "brentsmith-info-zone"
}

variable "zone_description" {
  type    = string
  default = "brentsmith.info DNS Zone"
}