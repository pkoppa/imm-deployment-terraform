terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}

resource "intersight_vnic_eth_qos_policy" "ethernet_qos_policy" {
  name           = var.name_of_ethernet_qos_policy
  description    = var.description_of_ethernet_qos_policy
  mtu            = var.mtu
  cos            = var.class_of_service
  burst          = var.burst
  priority       = var.priority
  rate_limit     = var.rate_limit
  trust_host_cos = false

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }

}