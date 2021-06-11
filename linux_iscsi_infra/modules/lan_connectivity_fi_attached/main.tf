terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}


resource "intersight_vnic_lan_connectivity_policy" "lan_connectivity_fi_attached" {
  name                = var.name_of_lan_connectivty_policy_fi_attached
  description         = var.description_of_lan_connectivty_policy_fi_attached
  iqn_allocation_type = "Pool"
  placement_mode      = "auto"
  static_iqn_name     = ""
  target_platform     = "FIAttached"

  iqn_pool = [{
    moid                  = var.iqn_pool_moid_for_lc
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}


resource "intersight_vnic_eth_if" "mgmt" {
  name             = "mgmt"
  failover_enabled = true
  mac_address_type = "POOL"

  lan_connectivity_policy = [{
    moid                  = intersight_vnic_lan_connectivity_policy.lan_connectivity_fi_attached.id
    object_type           = "vnic.LanConnectivityPolicy"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_adapter_policy = [{
    moid                  = var.ethernet_adapter_policy_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_qos_policy = [{
    moid                  = var.qos_policy_mgmt
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_control_policy = [{
    moid                  = var.ethernet_network_control_policy_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_group_policy = [{
    moid                  = var.ethernet_network_group_policy_mgmt_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  mac_pool = [{
    moid                  = var.mac_pool_mod_for_vnics
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  cdn = [{
    nr_source             = "vnic"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    value                 = ""
  }]

  placement = [{
    switch_id             = "A"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    pci_link              = 0
    uplink                = 0
    id                    = ""

  }]
}




resource "intersight_vnic_eth_if" "iscsi-a" {
  name             = "iscsi-a"
  failover_enabled = false
  mac_address_type = "POOL"

  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.lan_connectivity_fi_attached.id
    object_type = "vnic.LanConnectivityPolicy"
  }

  eth_adapter_policy = [{
    moid                  = var.ethernet_adapter_policy_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_qos_policy = [{
    moid                  = var.qos_policy_iscsi
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_control_policy = [{
    moid                  = var.ethernet_network_control_policy_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_group_policy = [{
    moid                  = var.ethernet_network_group_policy-iscsi-a
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  mac_pool = [{
    moid                  = var.mac_pool_mod_for_vnics
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  cdn = [{
    nr_source             = "vnic"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    value                 = ""
  }]


  iscsi_boot_policy = [{
    moid                  = var.iscsi-a-boot-policy-moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  placement = [{
    switch_id             = "A"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    pci_link              = 0
    uplink                = 0
    id                    = ""
  }]
}


resource "intersight_vnic_eth_if" "iscsi-b" {
  name             = "iscsi-b"
  failover_enabled = false
  mac_address_type = "POOL"

  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.lan_connectivity_fi_attached.id
    object_type = "vnic.LanConnectivityPolicy"
  }

  eth_adapter_policy = [{
    moid                  = var.ethernet_adapter_policy_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_qos_policy = [{
    moid                  = var.qos_policy_iscsi
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_control_policy = [{
    moid                  = var.ethernet_network_control_policy_moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_group_policy = [{
    moid                  = var.ethernet_network_group_policy-iscsi-b
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""

  }]

  mac_pool = [{
    moid                  = var.mac_pool_mod_for_vnics
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  cdn = [{
    nr_source             = "vnic"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    value                 = ""
  }]

  iscsi_boot_policy = [{
    moid                  = var.iscsi-b-boot-policy-moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]
  placement = [{
    switch_id             = "B"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    pci_link              = 0
    uplink                = 1
    id                    = ""
  }]
}