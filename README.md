# Description
This module is used to deploy a Network Connectivity Center.

## Sample

### Sample - Basic Network Connectivity Center Setup
```
hub = {
  "hub" = {
    description = "Sample Hub"
    labels = {
      "owner" = "devoteam"
    }
    project  = "google-cloud-project"
    toCreate = true
  }
}

spoke = {
  "spoke" = {
    description = "Sample Spoke Configuration"
    hub         = "hub"

    labels = {
      "owner"      = "devoteam"
      "team"       = "infra"
      "env"        = "foundations"
      "visibility" = "private"
    }


    linked_router_appliance_instances = [{
      instances = {
        "instance1" = {
          ip_address      = "X.X.X.X
          toCreate        = true
          virtual_machine = "https://www.googleapis.com/compute/v1/projects/$PROJECT/zones/$ZONE/instances/$NAME"
        }
      }
      site_to_site_data_transfer = false
      toEnable                   = true
    }]


    linked_vpn_tunnels = [{
      toEnable = false
    }]

    linked_interconnect_attachments = [{
      toEnable = false
    }]


    location = "value"
    project  = "google-cloud-project"
    toCreate = true
  }
}
```

## Notes
```
- For each Spoke created you can only specify one of the three type of resources ( Instance Router, VPN Tunnel or Interconnect ) and you must disable the others on the configuration of that Spoke.
- The Interconnect section has not been tested yet.
```
## Documentation
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_hub
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_spoke
https://cloud.google.com/network-connectivity-center