variable "hub" {
  type = map(object({
    toCreate    = bool
    description = optional(string)
    labels      = optional(map(string))
    project     = optional(string)
  }))
}

variable "spoke" {
  type = map(object({
    toCreate    = bool
    location    = string
    hub         = string
    project     = string
    description = optional(string)
    labels      = optional(map(string))

    linked_router_appliance_instances = optional(list(object({
      toEnable                   = bool
      site_to_site_data_transfer = optional(bool)
      instances = optional(map(object({
        toCreate        = bool
        ip_address      = string
        virtual_machine = string
      })))

    })))

    linked_vpn_tunnels = optional(list(object({
      toEnable                   = bool
      site_to_site_data_transfer = optional(bool)
      uris                       = optional(list(string))

    })))

    linked_interconnect_attachments = optional(list(object({
      toEnable                   = bool
      site_to_site_data_transfer = optional(bool)
      uris                       = optional(list(string))
    })))

  }))
  default = {}
}
