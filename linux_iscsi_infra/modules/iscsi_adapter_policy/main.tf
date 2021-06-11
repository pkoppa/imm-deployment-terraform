terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}

resource "intersight_vnic_iscsi_adapter_policy" "iscsi_adapter_policy" {
  name                 = var.name_of_iscsi_adapter_policy
  description          = var.description_of_iscsi_adapter_policy
  connection_time_out  = var.tcp_connection_time_out
  dhcp_timeout         = var.dhcp_timeout
  lun_busy_retry_count = var.lun_busy_retry_count
  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}