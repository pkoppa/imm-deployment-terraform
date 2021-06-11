terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}


resource "intersight_fabric_eth_network_control_policy" "ethernet_network_control_policy" {
  name                  = var.name_of_network_control_policy
  description           = var.description_of_network_control_policy
  cdp_enabled           = true
  forge_mac             = "allow"
  mac_registration_mode = "nativeVlanOnly"
  uplink_fail_action    = "linkDown"
  lldp_settings = [{
    objectType            = "fabric.LldpSettings"
    receive_enabled       = true
    transmit_enabled      = true
    additional_properties = ""
    class_id              = ""
    object_type           = ""
  }]
  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}