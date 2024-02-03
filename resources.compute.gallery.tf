# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------------
# Azure Compute Image Gallery - Default is "false"
#---------------------------------------------------------------

resource "azurerm_shared_image_gallery" "compute_image_gallery" {
  name = local.compute_image_gallery_name

  location            = local.location
  resource_group_name = local.resource_group_name
  description         = var.compute_image_gallery_description

  dynamic "sharing" {
    for_each = var.compute_gallery[*]
    content {
      permission = sharing.value.permission    
    }
  }

  dynamic "sharing" {
    for_each = enable_community_gallery ? [var.compute_gallery[*]] : []
    content {
      permission = "Community"

      community_gallery {
        eula            = sharing.value.eula
        prefix          = sharing.value.prefix
        publisher_email = sharing.value.publisher_email
        publisher_uri   = sharing.value.publisher_uri
      }
    }
  }

  tags = merge(local.default_tags, var.add_tags)
} 

