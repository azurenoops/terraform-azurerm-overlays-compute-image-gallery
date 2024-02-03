# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

##############################################
# Azure Compute Image Gallery Configuration ##
##############################################

variable "compute_image_gallery_description" {
  description = "A description for this compute Image Gallery."
  type        = string
  default     = null
}

variable "compute_gallery" {
  description = "Configure the Azure Compute Image Gallery."
  type = object({
    eula            = optional(string)
    prefix          = optional(string)
    publisher_email = optional(string)
    publisher_uri   = optional(string)
    permission      = optional(string, "Private")
  })
  default = null
}

variable "enable_community_gallery" {
  description = "Enable the Community Gallery."
  type        = bool
  default     = false  
}