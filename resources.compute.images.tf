# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#---------------------------------------------------------------
# Azure Compute Image - Default is "false"
#---------------------------------------------------------------

resource "azurerm_compute_image" "compute_image" {
  for_each            = { for x in var.compute_images_definitions : x.name => x }
  name                = each.value.name
  gallery_name        = azurerm_shared_image_gallery.compute_image_gallery.name
  resource_group_name = local.resource_group_name
  location            = local.location

  identifier {
    offer     = each.value.identifier.offer
    publisher = each.value.identifier.publisher
    sku       = each.value.identifier.sku
  }

  os_type                = each.value.os_type
  description            = each.value.description
  disk_types_not_allowed = each.value.disk_types_not_allowed
  end_of_life_date       = each.value.end_of_life_date
  eula                   = each.value.eula
  specialized            = each.value.specialized
  architecture           = each.value.architecture
  hyper_v_generation     = each.value.hyper_v_generation

  max_recommended_vcpu_count = each.value.max_recommended_vcpu_count
  min_recommended_vcpu_count = each.value.min_recommended_vcpu_count

  max_recommended_memory_in_gb = each.value.max_recommended_memory_in_gb
  min_recommended_memory_in_gb = each.value.min_recommended_memory_in_gb

  privacy_statement_uri = each.value.privacy_statement_uri
  release_note_uri      = each.value.release_note_uri

  trusted_launch_enabled = each.value.trusted_launch_enabled

  confidential_vm_supported = each.value.confidential_vm_supported
  confidential_vm_enabled   = each.value.confidential_vm_enabled

  accelerated_network_support_enabled = each.value.accelerated_network_support_enabled

  tags = each.value.tags

}