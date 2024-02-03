# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

##################################
# Shared Image Configuration    ##
##################################

variable "compute_images_definitions" {
  description = "Create Azure Compute Image Definition."
  type = list(object({
    name = string
    identifier = object({
      offer     = string
      publisher = string
      sku       = string
    })
    os_type                             = string
    description                         = optional(string)
    disk_types_not_allowed              = optional(list(string))
    end_of_life_date                    = optional(string)
    eula                                = optional(string)
    specialized                         = optional(bool)
    architecture                        = optional(string, "x64")
    hyper_v_generation                  = optional(string, "V1")
    max_recommended_vcpu_count          = optional(number)
    min_recommended_vcpu_count          = optional(number)
    max_recommended_memory_in_gb        = optional(number)
    min_recommended_memory_in_gb        = optional(number)
    privacy_statement_uri               = optional(string)
    release_note_uri                    = optional(string)
    trusted_launch_enabled              = optional(bool)
    confidential_vm_supported           = optional(bool)
    confidential_vm_enabled             = optional(bool)
    accelerated_network_support_enabled = optional(bool)
    tags                                = optional(map(string))
  }))
  default = []
}