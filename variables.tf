// Project related variables
variable "project" {
  default     = ""
  description = "GCP project id"
  type        = string
}
variable "region" {
  default     = ""
  type        = string
  description = "GCP region"
}

variable "zone" {
  default     = ""
  description = "GCP zone"
  type        = string
}

variable "key" {
  default     = " "
  description = "path to json key to service account"
  type        = string
}



//VPC related variables
variable "vpc_name" {
  default     = "me-vpc"
  type        = string
  description = "GCP VPC name"
}

variable "subnet_name" {
  default     = "my-subnet"
  type        = string
  description = "VPC subnet name"
}

variable "cidr" {
  default     = "192.168.88.0/24"
  type        = string
  description = "VPC subnet cidr address"
}

/*Instance related variables
variable "instance_type" {
  type = string
  description = "GCE instance machine type"
}

variable "instance_image" {
  type = string
  description = "GCE instance image"
}

variable "instance_name" {
  type = string
  description = "GCE instance name"
}*/
