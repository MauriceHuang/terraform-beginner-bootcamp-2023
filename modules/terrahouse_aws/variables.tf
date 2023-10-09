variable "user_uuid" {
    description = "The UUID of the user"
    type = string
  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.user_uuid))
    error_message = "User UUID must be in the format of a UUID (e.g., 123e4567-e89b-12d3-a456-426655440000)"
  }
}

variable "bucket_name" {
  type        = string
  description = "AWS S3 bucket name"

  validation {
    condition     = can(regex("^[-.a-z0-9]{3,63}$", var.bucket_name))
    error_message = "Invalid bucket name. Bucket names must be between 3 and 63 characters long and can only contain lowercase letters, numbers, hyphens, and periods."
  }
}

variable "index_html_filepath" {
  type    = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "Invalid path specified for index_html_path variable."
  }
}

variable "error_html_filepath" {
  type    = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "Invalid path specified for error_html_path variable."
  }
}
variable "content_version" {
  description = "The content version, which starts with 1."
  type        = number
  default     = 1  
  validation {
    condition = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must start with 1."
  }
}

variable "assets_path" {
  description = "The Path to the asset folder"
  type = string
  
}