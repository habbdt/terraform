variable "gcs_bucket_01" {
    description     = "gcs bucket 01"
    type            = string
    default         = null
}

variable "gcp_project" {
    description = "gcp project"
    type        = string
    default     = null
}

variable "gce_instance_01" {
    description = "gce instance 01"
    type        = string
    default     = null
}

variable "machine_type" {
    description = "gce machine type"
    type        = string
    default     = null
}

variable "zone" {
    description = "gce instance zone"
    type        = string
    default     = null
}

variable "image_family" {
    description = "gce image family"
    type        = string
    default     = null
}

variable "startup_script" {
    description = "start up script to install docker, gcsfuse"
    type        = string
    default     = null
}