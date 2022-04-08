variable "project_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "auto_mode" {
  type = bool
}

variable "subnet_name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "region" {
  type  = string
}

variable "router_name" {
  type = string
  default = "my-router"
}

variable "router_nat_name" {
  type = string
  default = "my-router-nat"
}

variable "firewall_name" {
  type = string
  default = "my-firewall"
}