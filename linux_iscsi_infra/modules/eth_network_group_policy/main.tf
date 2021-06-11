terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}


resource "intersight_fabric_eth_network_group_policy" "ethernet_network_group_policy" {
  name          = var.name_of_ethernet_network_group_policy
  description   = var.description_of_ethernet_network_group_policy
  vlan_settings = [{ native_vlan = var.native_vlan, allowed_vlans = tostring(var.allowed_vlans), additional_properties = "", class_id = "", object_type = "" }]
  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}


