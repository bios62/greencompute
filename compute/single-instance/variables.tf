# Variable definitions
variable "compartment_ocid" {
  description = "OCID of the compartment where resources will be created"
  type        = string
}

variable "subnet_ocid" {
  description = "OCID of the subnet where the compute instance will be placed"
  type        = string
}

variable "instance_shape" {
  description = "Shape of the compute instance (e.g., VM.Standard.E4.Flex)"
  type        = string
}

variable "instance_name_prefix" {
  description = "Prefix for the compute instance display names (e.g., web-server)"
  type        = string
  default     = "instance"
}

variable "os_name" {
  description = "Operating system name for the image (e.g., Canonical Ubuntu)"
  type        = string
  default     = "Canonical Ubuntu"
}

variable "os_version" {
  description = "Operating system version for the image (e.g., 22.04)"
  type        = string
  default     = "22.04"
}

variable "availability_domain" {
  description = "availability domain for the resource"
  type        = string
  default     = "SJPU:EU-FRANKFURT-1-AD-1"
}

