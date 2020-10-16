variable "tags" {
  description = "Map of additional tags to apply to all resources"
  type = map
  default = {}
}

variable "pan_authcode" {
  type = string
}

variable "vm_auth_key" {
  type = string
}

variable "panorama1_ip" {
  type        = string
  description = "IP of primary Panorama"
  default = ""
}

variable "panorama2_ip" {
  type        = string
  description = "IP of secondary ha Panorama"
  default = ""
}

variable "bootstrap_environments" {
  type        = map
  description = "list of each separate bootstrap package to generate"
}

variable "bootstrap_phash" {
  type        = string
  description = "Hashed password to set in bootstrap.xml for initial admin credentials"
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

variable "local_directory" {
  description = "local folder to copy to s3"
  type        = string
  default     = "bootstrap_files"
}

variable "bucket_prefix" {
  description = "if set to true environment names will be used as s3 bucket prefixes"
  type = bool
  default = false
}