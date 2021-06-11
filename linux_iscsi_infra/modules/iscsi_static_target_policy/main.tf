terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}

resource "intersight_vnic_iscsi_static_target_policy" "iscsi_static_target_policy" {
  name        = var.name_of_iscsi_static_target_policy
  description = var.description_of_iscsi_static_target_policy
  ip_address  = var.target_ip
  port        = var.iscsi_port
  target_name = var.target_iqn
  lun = [{
    object_type           = "vnic.Lun"
    bootable              = true
    lun_id                = var.lun_id
    class_id              = "vnic.Lun"
    additional_properties = ""
  }]
  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}





