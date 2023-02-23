output "hub" {
  value = { for q, w in google_network_connectivity_hub.main : q => w }
}

output "spoke" {
  value = { for q, w in google_network_connectivity_spoke.main : q => w }
}