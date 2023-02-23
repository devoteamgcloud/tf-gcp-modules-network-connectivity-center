## Requirements

No requirements.

## Usage
Basic usage of this module is as follows:

```hcl
module "example" {
	 source  = "<module-path>"

	 # Required variables
	 hub  =

	 # Optional variables
	 spoke  = {}
}
```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.54.0 |

## Resources

| Name | Type |
|------|------|
| [google_network_connectivity_hub.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_hub) | resource |
| [google_network_connectivity_spoke.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_spoke) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hub"></a> [hub](#input\_hub) | n/a | <pre>map(object({<br>    toCreate    = bool<br>    description = optional(string)<br>    labels      = optional(map(string))<br>    project     = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_spoke"></a> [spoke](#input\_spoke) | n/a | <pre>map(object({<br>    toCreate    = bool<br>    location    = string<br>    hub         = string<br>    project     = string<br>    description = optional(string)<br>    labels      = optional(map(string))<br><br>    linked_router_appliance_instances = optional(list(object({<br>      toEnable                   = bool<br>      site_to_site_data_transfer = optional(bool)<br>      instances = optional(map(object({<br>        toCreate        = bool<br>        ip_address      = string<br>        virtual_machine = string<br>      })))<br><br>    })))<br><br>    linked_vpn_tunnels = optional(list(object({<br>      toEnable                   = bool<br>      site_to_site_data_transfer = optional(bool)<br>      uris                       = optional(list(string))<br><br>    })))<br><br>    linked_interconnect_attachments = optional(list(object({<br>      toEnable                   = bool<br>      site_to_site_data_transfer = optional(bool)<br>      uris                       = optional(list(string))<br>    })))<br><br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hub"></a> [hub](#output\_hub) | n/a |
| <a name="output_spoke"></a> [spoke](#output\_spoke) | n/a |