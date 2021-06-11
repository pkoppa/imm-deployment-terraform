terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}


resource "intersight_vnic_iscsi_boot_policy" "iscsi_boot_policy" {
  name                = var.name_of_iscsi_boot_policy
  description         = var.description_of_iscsi_boot_policy
  initiator_ip_source = "Pool"
  #is_password_set                = "Static"
  initiator_static_ip_v4_address = ""
  initiator_static_ip_v4_config  = []

  initiator_ip_pool = [{
    moid                  = var.ip_pool_moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  iscsi_adapter_policy = [{
    moid                  = var.iscsi_adapter_policy_moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  mutual_chap = [{
    object_type           = "vnic.IscsiAuthProfile"
    password              = ""
    user_id               = ""
    is_password_set       = false
    additional_properties = ""
    class_id              = "vnic.IscsiAuthProfile"
  }]

  primary_target_policy = [{
    moid                  = var.primary_target_moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  secondary_target_policy = [{
    moid                  = var.secondary_target_moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""

  }]

  chap = [{
    object_type           = "vnic.IscsiAuthProfile"
    password              = ""
    user_id               = ""
    is_password_set       = false
    additional_properties = ""
    class_id              = "vnic.IscsiAuthProfile"
  }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}