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

variable "bucket" {
  description = "Bucket name"
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Prefix of the bucket name"
  type        = string
  default     = null
}

variable "local_directory" {
  description = "local folder to copy to s3"
  type        = string
  default     = "files"
}
