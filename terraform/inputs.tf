////////////////////////////////
// AWS Connection
//
variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" { }

variable "aws_key_pair_file" { }

variable "key_name" { }

////////////////////////////////
// Networking Settings
//
variable "vpc_id" {}

variable "subnet_id" {}

////////////////////////////////
// Server Settings
//
variable "aws_centos_image_user" {
  default = "centos"
}

variable "ami" { 
  default = "ami-0036ab7a"
}

variable "instance_type" {
  default = "m4.large"
}

////////////////////////////////
// Habitat Settings
//
variable "origin" {
  default = "skylerto"
}

variable "channel" {
  default = "stable"
}

variable "depot_url" { }

////////////////////////////////
// Tags
//
variable "tag_customer" {
  default = "customer"
}

variable "tag_project" {
  default = "aem"
}

variable "tag_name" {
  default = "aem"
}

variable "tag_dept" {
  default = "devops"
}

variable "tag_contact" {
  default = "admins@bluepipeline.io"
}

variable "tag_application" {
  default = "aem"
}

variable "tag_ttl" {
  default = 3600
}
