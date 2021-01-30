variable "bucket_prefix" {
  description = "Bucket prefix name"
  type        = string
}

variable "authcode" {
  description = "Authcode to license the VM-series firewall"
  type        = string
}

variable "bootstrap_directories" {
  description = "The directories comprising the bootstrap package"
  type        = list(string)
  default = [
    "config/",
    "content/",
    "software/",
    "license/",
    "plugins/"
  ]
}

variable "hostname" {
  default     = ""
  description = "The hostname of the VM-series instance"
  type        = string
}

variable "panorama-server" {
  type        = string
  description = "IP of primary Panorama"
  default     = ""
}

variable "panorama-server2" {
  type        = string
  description = "IP of secondary ha Panorama"
  default     = ""
}

variable "tplname" {
  default     = ""
  description = "The Panorama template stack name"
  type        = string
}

variable "dgname" {
  default     = ""
  description = "The Panorama device group name"
  type        = string
}

variable "dns-primary" {
  type        = string
  description = "IP of primary DNS server"
  default     = ""
}

variable "dns-secondary" {
  type        = string
  description = "IP of secondary DNS server"
  default     = ""
}

variable "vm-auth-key" {
  default     = ""
  description = "Virtual machine authentication key"
  type        = string
}

variable "op-command-modes" {
  default     = ""
  description = "Set jumbo-frame and/or mgmt-interface-swap"
  type        = string
}

variable "bootstrap_user" {
  type        = string
  description = "Username of the initial user in the bootstrap.xml"
}

variable "bootstrap_phash" {
  type        = string
  description = "Hashed password to set in bootstrap.xml for initial user credentials"
}

variable "local_directory" {
  description = "local folder to copy to s3"
  type        = string
  default     = "bootstrap_files"
}

variable "tags" {
  description = "Map of additional tags to apply to all resources"
  type        = map(any)
  default     = {}
}
