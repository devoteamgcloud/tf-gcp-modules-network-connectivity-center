resource "google_network_connectivity_hub" "main" {
  for_each    = { for q, w in var.hub : q => w if w.toCreate == true }
  name        = each.key
  description = each.value.description
  project     = each.value.project
  labels      = each.value.labels
}

resource "google_network_connectivity_spoke" "main" {
  for_each    = { for q, w in var.spoke : q => w if w.toCreate == true }
  name        = each.key
  location    = each.value.location
  description = each.value.description
  labels      = each.value.labels
  hub         = each.value.hub
  project     = each.value.project


  dynamic "linked_router_appliance_instances" {
    for_each = { for q, w in each.value.linked_router_appliance_instances : q => w if w.toEnable == true }
    content {
      site_to_site_data_transfer = linked_router_appliance_instances.value.site_to_site_data_transfer
      dynamic "instances" {
        for_each = { for q, w in linked_router_appliance_instances.value.instances : q => w if w.toCreate == true }
        content {
          ip_address      = instances.value.ip_address
          virtual_machine = instances.value.virtual_machine
        }

      }
    }

  }



  dynamic "linked_vpn_tunnels" {
    for_each = { for q, w in each.value.linked_vpn_tunnels : q => w if w.toEnable == true }
    content {
      site_to_site_data_transfer = linked_vpn_tunnels.value.site_to_site_data_transfer
      uris                       = linked_vpn_tunnels.value.uris
    }
  }

  # These section has not been tested
  dynamic "linked_interconnect_attachments" {
    for_each = { for q, w in each.value.linked_interconnect_attachments : q => w if w.toEnable == true }
    content {
      site_to_site_data_transfer = linked_interconnect_attachments.value.site_to_site_data_transfer
      uris                       = linked_interconnect_attachments.value.uris
    }
  }

  depends_on = [
    google_network_connectivity_hub.main
  ]

}