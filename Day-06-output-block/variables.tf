variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
  default     = ""
}