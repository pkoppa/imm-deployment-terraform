#IMC Access Policy
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


#Boot Policy for iSCSI Boot
resource "intersight_boot_precision_policy" "boot_policy_for_iscsi_boot_from_san" {
  name        = var.boot_policy_name
  description = var.boot_policy_description

  configured_boot_mode = var.boot_mode
  boot_devices = var.boot_mode == "Uefi" ? [{ enabled = true, class_id = "boot.VirtualMedia", name = "kvm-mapped-dvd", object_type = "boot.VirtualMedia", additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" }) },
    { enabled = true, class_id = "boot.Iscsi", name = "iscsi-a", interface_name = "iscsi-a", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-a", bootloader = { description = "rhel", name = "bootx64.efi", path = "\\EFI\\BOOT\\BOOTx64.EFI" } }) },
    { enabled = true, class_id = "boot.Iscsi", name = "iscsi-b", interface_name = "iscsi-b", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-b", bootloader = { description = "rhel", name = "bootx64.efi", path = "\\EFI\\BOOT\\BOOTx64.EFI" } }) }] : [{ enabled = true, class_id = "boot.VirtualMedia", name = "kvm-mapped-dvd", object_type = "boot.VirtualMedia", additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" }) },
    { enabled = true, class_id = "boot.Iscsi", name = "iscsi-a", interface_name = "iscsi-a", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-a" }) },
  { enabled = true, class_id = "boot.Iscsi", name = "iscsi-b", interface_name = "iscsi-b", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-b" }) }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#BIOS Policy
resource "intersight_bios_policy" "bios_policy" {
  name        = var.name_of_bios_policy
  description = var.description_of_bios_policy

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
  acs_control_gpu1state                 = "platform-default"
  acs_control_gpu2state                 = "platform-default"
  acs_control_gpu3state                 = "platform-default"
  acs_control_gpu4state                 = "platform-default"
  acs_control_gpu5state                 = "platform-default"
  acs_control_gpu6state                 = "platform-default"
  acs_control_gpu7state                 = "platform-default"
  acs_control_gpu8state                 = "platform-default"
  acs_control_slot11state               = "platform-default"
  acs_control_slot12state               = "platform-default"
  acs_control_slot13state               = "platform-default"
  acs_control_slot14state               = "platform-default"
  cdn_support                           = "platform-default"
  lom_port0state                        = "platform-default"
  lom_port1state                        = "platform-default"
  lom_port2state                        = "platform-default"
  lom_port3state                        = "platform-default"
  lom_ports_all_state                   = "platform-default"
  pci_option_ro_ms                      = "platform-default"
  pci_rom_clp                           = "platform-default"
  slot10link_speed                      = "platform-default"
  slot10state                           = "platform-default"
  slot11link_speed                      = "platform-default"
  slot11state                           = "platform-default"
  slot12link_speed                      = "platform-default"
  slot12state                           = "platform-default"
  slot13state                           = "platform-default"
  slot14state                           = "platform-default"
  slot1link_speed                       = "platform-default"
  slot1state                            = "platform-default"
  slot2link_speed                       = "platform-default"
  slot2state                            = "platform-default"
  slot3link_speed                       = "platform-default"
  slot3state                            = "platform-default"
  slot4link_speed                       = "platform-default"
  slot4state                            = "platform-default"
  slot5link_speed                       = "platform-default"
  slot5state                            = "platform-default"
  slot6link_speed                       = "platform-default"
  slot6state                            = "platform-default"
  slot7link_speed                       = "platform-default"
  slot7state                            = "platform-default"
  slot8link_speed                       = "platform-default"
  slot8state                            = "platform-default"
  slot9link_speed                       = "platform-default"
  slot9state                            = "platform-default"
  slot_flom_link_speed                  = "platform-default"
  slot_front_nvme1link_speed            = "platform-default"
  slot_front_nvme2link_speed            = "platform-default"
  slot_front_slot5link_speed            = "platform-default"
  slot_front_slot6link_speed            = "platform-default"
  slot_gpu1state                        = "platform-default"
  slot_gpu2state                        = "platform-default"
  slot_gpu3state                        = "platform-default"
  slot_gpu4state                        = "platform-default"
  slot_gpu5state                        = "platform-default"
  slot_gpu6state                        = "platform-default"
  slot_gpu7state                        = "platform-default"
  slot_gpu8state                        = "platform-default"
  slot_hba_link_speed                   = "platform-default"
  slot_hba_state                        = "platform-default"
  slot_lom1link                         = "platform-default"
  slot_lom2link                         = "platform-default"
  slot_mezz_state                       = "platform-default"
  slot_mlom_link_speed                  = "platform-default"
  slot_mlom_state                       = "platform-default"
  slot_mraid_link_speed                 = "platform-default"
  slot_mraid_state                      = "platform-default"
  slot_n10state                         = "platform-default"
  slot_n11state                         = "platform-default"
  slot_n12state                         = "platform-default"
  slot_n13state                         = "platform-default"
  slot_n14state                         = "platform-default"
  slot_n15state                         = "platform-default"
  slot_n16state                         = "platform-default"
  slot_n17state                         = "platform-default"
  slot_n18state                         = "platform-default"
  slot_n19state                         = "platform-default"
  slot_n1state                          = "platform-default"
  slot_n20state                         = "platform-default"
  slot_n21state                         = "platform-default"
  slot_n22state                         = "platform-default"
  slot_n23state                         = "platform-default"
  slot_n24state                         = "platform-default"
  slot_n2state                          = "platform-default"
  slot_n3state                          = "platform-default"
  slot_n4state                          = "platform-default"
  slot_n5state                          = "platform-default"
  slot_n6state                          = "platform-default"
  slot_n7state                          = "platform-default"
  slot_n8state                          = "platform-default"
  slot_n9state                          = "platform-default"
  slot_raid_link_speed                  = "platform-default"
  slot_raid_state                       = "platform-default"
  slot_rear_nvme1link_speed             = "platform-default"
  slot_rear_nvme1state                  = "platform-default"
  slot_rear_nvme2link_speed             = "platform-default"
  slot_rear_nvme2state                  = "platform-default"
  slot_rear_nvme3state                  = "platform-default"
  slot_rear_nvme4state                  = "platform-default"
  slot_rear_nvme5state                  = "platform-default"
  slot_rear_nvme6state                  = "platform-default"
  slot_rear_nvme7state                  = "platform-default"
  slot_rear_nvme8state                  = "platform-default"
  slot_riser1link_speed                 = "platform-default"
  slot_riser1slot1link_speed            = "platform-default"
  slot_riser1slot2link_speed            = "platform-default"
  slot_riser1slot3link_speed            = "platform-default"
  slot_riser2link_speed                 = "platform-default"
  slot_riser2slot4link_speed            = "platform-default"
  slot_riser2slot5link_speed            = "platform-default"
  slot_riser2slot6link_speed            = "platform-default"
  slot_sas_state                        = "platform-default"
  slot_ssd_slot1link_speed              = "platform-default"
  slot_ssd_slot2link_speed              = "platform-default"
  adjacent_cache_line_prefetch          = "platform-default"
  altitude                              = "platform-default"
  auto_cc_state                         = "platform-default"
  autonumous_cstate_enable              = "platform-default"
  boot_performance_mode                 = "platform-default"
  cbs_cmn_cpu_gen_downcore_ctrl         = "platform-default"
  channel_inter_leave                   = "platform-default"
  closed_loop_therm_throtl              = "platform-default"
  cmci_enable                           = "platform-default"
  config_tdp                            = "platform-default"
  core_multi_processing                 = "platform-default"
  cpu_energy_performance                = "platform-default"
  cpu_frequency_floor                   = "platform-default"
  cpu_performance                       = "platform-default"
  cpu_power_management                  = "platform-default"
  demand_scrub                          = "platform-default"
  direct_cache_access                   = "platform-default"
  dram_clock_throttling                 = "platform-default"
  energy_efficient_turbo                = "platform-default"
  eng_perf_tuning                       = "platform-default"
  enhanced_intel_speed_step_tech        = "platform-default"
  epp_profile                           = "platform-default"
  execute_disable_bit                   = "platform-default"
  extended_apic                         = "platform-default"
  hardware_prefetch                     = "platform-default"
  hwpm_enable                           = "platform-default"
  imc_interleave                        = "platform-default"
  intel_hyper_threading_tech            = "platform-default"
  intel_speed_select                    = "platform-default"
  intel_turbo_boost_tech                = "platform-default"
  intel_virtualization_technology       = "platform-default"
  ioh_error_enable                      = "platform-default"
  ip_prefetch                           = "platform-default"
  kti_prefetch                          = "platform-default"
  llc_prefetch                          = "platform-default"
  memory_inter_leave                    = "platform-default"
  package_cstate_limit                  = "platform-default"
  patrol_scrub                          = "platform-default"
  patrol_scrub_duration                 = "platform-default"
  pc_ie_ssd_hot_plug_support            = "platform-default"
  processor_c1e                         = "platform-default"
  processor_c3report                    = "platform-default"
  processor_c6report                    = "platform-default"
  processor_cstate                      = "platform-default"
  pstate_coord_type                     = "platform-default"
  pwr_perf_tuning                       = "platform-default"
  rank_inter_leave                      = "platform-default"
  single_pctl_enable                    = "platform-default"
  smt_mode                              = "platform-default"
  snc                                   = "platform-default"
  streamer_prefetch                     = "platform-default"
  svm_mode                              = "platform-default"
  work_load_config                      = "platform-default"
  xpt_prefetch                          = "platform-default"
  all_usb_devices                       = "platform-default"
  legacy_usb_support                    = "platform-default"
  make_device_non_bootable              = "platform-default"
  pch_usb30mode                         = "platform-default"
  usb_emul6064                          = "platform-default"
  usb_port_front                        = "platform-default"
  usb_port_internal                     = "platform-default"
  usb_port_kvm                          = "platform-default"
  usb_port_rear                         = "platform-default"
  usb_port_sd_card                      = "platform-default"
  usb_port_vmedia                       = "platform-default"
  usb_xhci_support                      = "platform-default"
  aspm_support                          = "platform-default"
  ioh_resource                          = "platform-default"
  memory_mapped_io_above4gb             = "platform-default"
  mmcfg_base                            = "platform-default"
  onboard10gbit_lom                     = "platform-default"
  onboard_gbit_lom                      = "platform-default"
  sr_iov                                = "platform-default"
  vga_priority                          = "platform-default"
  assert_nmi_on_perr                    = "platform-default"
  assert_nmi_on_serr                    = "platform-default"
  baud_rate                             = "platform-default"
  cdn_enable                            = "platform-default"
  cisco_adaptive_mem_training           = "platform-default"
  cisco_debug_level                     = "platform-default"
  cisco_oprom_launch_optimization       = "platform-default"
  console_redirection                   = "platform-default"
  flow_control                          = "platform-default"
  frb2enable                            = "platform-default"
  legacy_os_redirection                 = "platform-default"
  os_boot_watchdog_timer                = "platform-default"
  os_boot_watchdog_timer_policy         = "platform-default"
  os_boot_watchdog_timer_timeout        = "platform-default"
  out_of_band_mgmt_port                 = "platform-default"
  putty_key_pad                         = "platform-default"
  redirection_after_post                = "platform-default"
  terminal_type                         = "platform-default"
  ucsm_boot_order_rule                  = "platform-default"
  bme_dma_mitigation                    = "platform-default"
  cbs_cmn_gnb_nb_iommu                  = "platform-default"
  cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = "platform-default"
  cbs_cmn_mem_map_bank_interleave_ddr4  = "platform-default"
  cbs_df_cmn_mem_intlv                  = "platform-default"
  cbs_df_cmn_mem_intlv_size             = "platform-default"
  dcpmm_firmware_downgrade              = "platform-default"
  smee                                  = "platform-default"
  boot_option_num_retry                 = "platform-default"
  boot_option_re_cool_down              = "platform-default"
  boot_option_retry                     = "platform-default"
  ipv6pxe                               = "platform-default"
  onboard_scu_storage_support           = "platform-default"
  onboard_scu_storage_sw_stack          = "platform-default"
  pop_support                           = "platform-default"
  psata                                 = "platform-default"
  sata_mode_select                      = "platform-default"
  vmd_enable                            = "platform-default"
  cbs_cmn_cpu_cpb                       = "platform-default"
  cbs_cmn_cpu_global_cstate_ctrl        = "platform-default"
  cbs_cmn_cpu_l1stream_hw_prefetcher    = "platform-default"
  cbs_cmn_cpu_l2stream_hw_prefetcher    = "platform-default"
  cbs_cmn_determinism_slider            = "platform-default"
  cbs_cmnc_tdp_ctl                      = "platform-default"
  cke_low_policy                        = "platform-default"
  dram_refresh_rate                     = "platform-default"
  lv_ddr_mode                           = "platform-default"
  mirroring_mode                        = "platform-default"
  numa_optimized                        = "platform-default"
  select_memory_ras_configuration       = "mirror-mode-1lm"
  sparing_mode                          = "platform-default"
  intel_vt_for_directed_io              = "platform-default"
  intel_vtd_coherency_support           = "platform-default"
  intel_vtd_interrupt_remapping         = "platform-default"
  intel_vtd_pass_through_dma_support    = "platform-default"
  intel_vtdats_support                  = "platform-default"
  post_error_pause                      = "platform-default"
  tpm_support                           = "platform-default"
  qpi_link_frequency                    = "platform-default"
  qpi_snoop_mode                        = "platform-default"
  serial_port_aenable                   = "platform-default"
  tpm_control                           = "platform-default"
  txt_support                           = "platform-default"
}





#iSCSI Adapter Policy
resource "intersight_vnic_iscsi_adapter_policy" "iscsi_adapter_policy" {
  name        = var.name_of_iscsi_adapter_policy
  description = var.description_of_iscsi_adapter_policy

  connection_time_out  = var.tcp_connection_time_out
  dhcp_timeout         = var.dhcp_timeout
  lun_busy_retry_count = var.lun_busy_retry_count

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#iSCSI-A Primary Target Policy
resource "intersight_vnic_iscsi_static_target_policy" "iscsi_a_primary_target" {
  name        = var.name_of_iscsi_a_primary_target_policy
  description = var.description_of_iscsi_a_primary_target_policy

  ip_address  = var.target_ip_of_iscsi_a_primary
  port        = var.iscsi_port_of_iscsi_a_primary
  target_name = var.target_iqn_of_iscsi_a_primary
  lun = [{
    object_type           = "vnic.Lun"
    bootable              = true
    lun_id                = var.lun_id_of_iscsi_a_primary
    class_id              = "vnic.Lun"
    additional_properties = ""
  }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#iSCSI-A Secondary Target Policy
resource "intersight_vnic_iscsi_static_target_policy" "iscsi_a_secondary_target" {
  name        = var.name_of_iscsi_a_secondary_target_policy
  description = var.description_of_iscsi_a_secondary_target_policy

  ip_address  = var.target_ip_of_iscsi_a_secondary
  port        = var.iscsi_port_of_iscsi_a_secondary
  target_name = var.target_iqn_of_iscsi_a_secondary
  lun = [{
    object_type           = "vnic.Lun"
    bootable              = true
    lun_id                = var.lun_id_of_iscsi_a_secondary
    class_id              = "vnic.Lun"
    additional_properties = ""
  }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}



#iSCSI-B Primary Target Policy
resource "intersight_vnic_iscsi_static_target_policy" "iscsi_b_primary_target" {
  name        = var.name_of_iscsi_b_primary_target_policy
  description = var.description_of_iscsi_b_primary_target_policy

  ip_address  = var.target_ip_of_iscsi_b_primary
  port        = var.iscsi_port_of_iscsi_b_primary
  target_name = var.target_iqn_of_iscsi_b_primary
  lun = [{
    object_type           = "vnic.Lun"
    bootable              = true
    lun_id                = var.lun_id_of_iscsi_b_primary
    class_id              = "vnic.Lun"
    additional_properties = ""
  }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}



#iSCSI-B Secondary Target Policy
resource "intersight_vnic_iscsi_static_target_policy" "iscsi_b_secondary_target" {
  name        = var.name_of_iscsi_b_secondary_target_policy
  description = var.description_of_iscsi_b_secondary_target_policy

  ip_address  = var.target_ip_of_iscsi_b_secondary
  port        = var.iscsi_port_of_iscsi_b_secondary
  target_name = var.target_iqn_of_iscsi_b_secondary
  lun = [{
    object_type           = "vnic.Lun"
    bootable              = true
    lun_id                = var.lun_id_of_iscsi_b_secondary
    class_id              = "vnic.Lun"
    additional_properties = ""
  }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#Ethernet QoS Policy: MTU: 1500
resource "intersight_vnic_eth_qos_policy" "ethernet_qos_policy_mtu_1500" {
  name        = var.name_of_ethernet_qos_policy_mtu_1500
  description = var.description_of_ethernet_qos_policy_mtu_1500

  mtu            = var.mtu_1500
  cos            = var.class_of_service_mtu_1500
  burst          = var.burst_mtu_1500
  priority       = var.priority_mtu_1500
  rate_limit     = var.rate_limit_mtu_1500
  trust_host_cos = false

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }

}




#Ethernet QoS Policy: MTU: 9000
resource "intersight_vnic_eth_qos_policy" "ethernet_qos_policy_mtu_9000" {
  name        = var.name_of_ethernet_qos_policy_mtu_9000
  description = var.description_of_ethernet_qos_policy_mtu_9000

  mtu            = var.mtu_9000
  cos            = var.class_of_service_mtu_9000
  burst          = var.burst_mtu_9000
  priority       = var.priority_mtu_9000
  rate_limit     = var.rate_limit_mtu_9000
  trust_host_cos = false

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }

}




#Network Group Policy - Inband Management
resource "intersight_fabric_eth_network_group_policy" "ethernet_network_group_policy_inband_mgmt" {
  name        = var.name_of_ethernet_network_group_policy_inband_mgmt
  description = var.description_of_ethernet_network_group_policy_inband_mgmt

  vlan_settings = [{ native_vlan = var.native_vlan_inband_mgmt, allowed_vlans = tostring(var.allowed_vlans_inband_mgmt), additional_properties = "", class_id = "", object_type = "" }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#Network Group Policy - Out of Band Management
resource "intersight_fabric_eth_network_group_policy" "ethernet_network_group_policy_oob_mgmt" {
  name        = var.name_of_ethernet_network_group_policy_oob_mgmt
  description = var.description_of_ethernet_network_group_policy_oob_mgmt

  vlan_settings = [{ native_vlan = var.native_vlan_oob_mgmt, allowed_vlans = tostring(var.allowed_vlans_oob_mgmt), additional_properties = "", class_id = "", object_type = "" }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#Network Group Policy - iSCSI-A
resource "intersight_fabric_eth_network_group_policy" "ethernet_network_group_policy_iscsi_a" {
  name        = var.name_of_ethernet_network_group_policy_iscsi_a
  description = var.description_of_ethernet_network_group_policy_iscsi_a

  vlan_settings = [{ native_vlan = var.native_vlan_iscsi_a, allowed_vlans = tostring(var.allowed_vlans_iscsi_a), additional_properties = "", class_id = "", object_type = "" }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}





#Network Group Policy - iSCSI-B
resource "intersight_fabric_eth_network_group_policy" "ethernet_network_group_policy_iscsi_b" {
  name        = var.name_of_ethernet_network_group_policy_iscsi_b
  description = var.description_of_ethernet_network_group_policy_iscsi_b

  vlan_settings = [{ native_vlan = var.native_vlan_iscsi_b, allowed_vlans = tostring(var.allowed_vlans_iscsi_b), additional_properties = "", class_id = "", object_type = "" }]

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#Network Control Policy
resource "intersight_fabric_eth_network_control_policy" "ethernet_network_control_policy" {
  name        = var.name_of_network_control_policy
  description = var.description_of_network_control_policy

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


#Ethernet Adapter Policy for RHEL
resource "intersight_vnic_eth_adapter_policy" "rhel_ethernet_adapter_policy" {
  name        = var.name_of_rhel_ethernet_adapter_policy
  description = var.description_of_rhel_ethernet_adapter_policy

  advanced_filter         = false
  interrupt_scaling       = false
  rss_settings            = false
  uplink_failback_timeout = 5

  interrupt_settings {
    coalescing_time = 125
    coalescing_type = "MIN"
    nr_count        = 4
    mode            = "MSIx"
  }

  rss_hash_settings {
    class_id          = "vnic.RssHashSettings"
    object_type       = "vnic.RssHashSettings"
    ipv4_hash         = true
    ipv6_hash         = true
    ipv6_ext_hash     = false
    tcp_ipv4_hash     = true
    tcp_ipv6_ext_hash = false
    tcp_ipv6_hash     = true
    udp_ipv4_hash     = false
    udp_ipv6_hash     = false


  }

  completion_queue_settings {
    nr_count  = 2
    ring_size = 1
  }

  rx_queue_settings {
    nr_count  = 1
    ring_size = 512
  }

  tx_queue_settings {
    nr_count  = 1
    ring_size = 256
  }

  tcp_offload_settings {
    large_receive = true
    large_send    = true
    rx_checksum   = true
    tx_checksum   = true
  }
  arfs_settings {
    enabled = false
  }

  vxlan_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = false
  }

  roce_settings {
    enabled = false
  }

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}




#iSCSI-A Boot Policy
resource "intersight_vnic_iscsi_boot_policy" "iscsi_a_boot_policy" {
  name        = var.name_of_iscsi_a_boot_policy
  description = var.description_of_iscsi_a_boot_policy

  initiator_ip_source = "Pool"
  #is_password_set                = "Static"
  initiator_static_ip_v4_address = ""
  initiator_static_ip_v4_config  = []

  initiator_ip_pool = [{
    moid                  = var.iscsi_a_ip_pool_moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  iscsi_adapter_policy = [{
    moid                  = intersight_vnic_iscsi_adapter_policy.iscsi_adapter_policy.moid
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
    moid                  = intersight_vnic_iscsi_static_target_policy.iscsi_a_primary_target.moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  secondary_target_policy = [{
    moid                  = intersight_vnic_iscsi_static_target_policy.iscsi_a_secondary_target.moid
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







#iSCSI-B Boot Policy
resource "intersight_vnic_iscsi_boot_policy" "iscsi_b_boot_policy" {
  name        = var.name_of_iscsi_b_boot_policy
  description = var.description_of_iscsi_b_boot_policy

  initiator_ip_source = "Pool"
  #is_password_set                = "Static"
  initiator_static_ip_v4_address = ""
  initiator_static_ip_v4_config  = []

  initiator_ip_pool = [{
    moid                  = var.iscsi_b_ip_pool_moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  iscsi_adapter_policy = [{
    moid                  = intersight_vnic_iscsi_adapter_policy.iscsi_adapter_policy.moid
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
    moid                  = intersight_vnic_iscsi_static_target_policy.iscsi_b_primary_target.moid
    object_type           = ""
    additional_properties = ""
    class_id              = ""
    selector              = ""
  }]

  secondary_target_policy = [{
    moid                  = intersight_vnic_iscsi_static_target_policy.iscsi_b_secondary_target.moid
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



#LAN Connectivity Policy
resource "intersight_vnic_lan_connectivity_policy" "lan_connectivity_fi_attached" {
  name        = var.name_of_lan_connectivty_policy
  description = var.description_of_lan_connectivty_policy

  iqn_allocation_type = "Pool"
  placement_mode      = "auto"
  static_iqn_name     = ""
  target_platform     = "FIAttached"

  iqn_pool = [{
    moid                  = var.iqn_pool_moid_for_lan_connectivty
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


#VNIC: mgmt
resource "intersight_vnic_eth_if" "mgmt" {
  name             = "mgmt"
  failover_enabled = true
  mac_address_type = "POOL"

  lan_connectivity_policy = [{
    moid                  = intersight_vnic_lan_connectivity_policy.lan_connectivity_fi_attached.moid
    object_type           = "vnic.LanConnectivityPolicy"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_adapter_policy = [{
    moid                  = intersight_vnic_eth_adapter_policy.rhel_ethernet_adapter_policy.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_qos_policy = [{
    moid                  = intersight_vnic_eth_qos_policy.ethernet_qos_policy_mtu_1500.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_control_policy = [{
    moid                  = intersight_fabric_eth_network_control_policy.ethernet_network_control_policy.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_group_policy = [{
    moid                  = intersight_fabric_eth_network_group_policy.ethernet_network_group_policy_inband_mgmt.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  mac_pool = [{
    moid                  = var.moid_of_mac_pool_a
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



#VNIC: iscsi-a
resource "intersight_vnic_eth_if" "iscsi-a" {
  name             = "iscsi-a"
  failover_enabled = false
  mac_address_type = "POOL"

  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.lan_connectivity_fi_attached.moid
    object_type = "vnic.LanConnectivityPolicy"
  }

  eth_adapter_policy = [{
    moid                  = intersight_vnic_eth_adapter_policy.rhel_ethernet_adapter_policy.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_qos_policy = [{
    moid                  = intersight_vnic_eth_qos_policy.ethernet_qos_policy_mtu_9000.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_control_policy = [{
    moid                  = intersight_fabric_eth_network_control_policy.ethernet_network_control_policy.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_group_policy = [{
    moid                  = intersight_fabric_eth_network_group_policy.ethernet_network_group_policy_iscsi_a.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  mac_pool = [{
    moid                  = var.moid_of_mac_pool_a
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
    moid                  = intersight_vnic_iscsi_boot_policy.iscsi_a_boot_policy.moid
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

#VNIC: iscsi-b
resource "intersight_vnic_eth_if" "iscsi-b" {
  name             = "iscsi-b"
  failover_enabled = false
  mac_address_type = "POOL"

  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.lan_connectivity_fi_attached.moid
    object_type = "vnic.LanConnectivityPolicy"
  }

  eth_adapter_policy = [{
    moid                  = intersight_vnic_eth_adapter_policy.rhel_ethernet_adapter_policy.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  eth_qos_policy = [{
    moid                  = intersight_vnic_eth_qos_policy.ethernet_qos_policy_mtu_9000.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_control_policy = [{
    moid                  = intersight_fabric_eth_network_control_policy.ethernet_network_control_policy.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""
  }]

  fabric_eth_network_group_policy = [{
    moid                  = intersight_fabric_eth_network_group_policy.ethernet_network_group_policy_iscsi_b.moid
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    selector              = ""

  }]

  mac_pool = [{
    moid                  = var.moid_of_mac_pool_b
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
    moid                  = intersight_vnic_iscsi_boot_policy.iscsi_b_boot_policy.moid
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