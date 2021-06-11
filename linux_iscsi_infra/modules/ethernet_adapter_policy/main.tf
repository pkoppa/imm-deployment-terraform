terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}


resource "intersight_vnic_eth_adapter_policy" "ethernet_adapter_policy" {
  name                    = var.name_of_ethernet_adapter_policy
  description             = var.description_of_ethernet_adapter_policy
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

