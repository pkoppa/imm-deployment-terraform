terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}

resource "intersight_access_policy" "imc_access_policy" {
  name        = var.name_of_imc_access_policy
  description = var.description_of_imc_access_policy
  inband_vlan = var.cimc_access_vlan
  address_type {
    enable_ip_v4 = true
    enable_ip_v6 = false
  }
  inband_ip_pool {
    object_type = "ippool.Pool"
    moid        = var.ip_pool_for_cimc_access
  }

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }

}
