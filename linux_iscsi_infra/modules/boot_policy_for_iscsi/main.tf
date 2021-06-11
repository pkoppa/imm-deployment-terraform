terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}



resource "intersight_boot_precision_policy" "boot_policy_for_iscsi_boot_from_san" {
  name                 = var.boot_policy_name
  description          = var.boot_policy_description
  configured_boot_mode = var.boot_mode
  boot_devices = var.boot_mode == "Uefi" ? [{ enabled = true, class_id = "boot.VirtualMedia", name = "kvm-mapped-dvd", object_type = "boot.VirtualMedia", additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" }) },
    { enabled = true, class_id = "boot.Iscsi", name = "iscsi-a", interface_name = "iscsi-aaaa", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-a", bootloader = { description = "rhel", name = "bootx64.efi", path = "\\EFI\\BOOT\\BOOTx64.EFI" } }) },
    { enabled = true, class_id = "boot.Iscsi", name = "iscsi-b", interface_name = "iscsi-bbbb", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-b", bootloader = { description = "rhel", name = "bootx64.efi", path = "\\EFI\\BOOT\\BOOTx64.EFI" } }) }] : [{ enabled = true, class_id = "boot.VirtualMedia", name = "kvm-mapped-dvd", object_type = "boot.VirtualMedia", additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" }) },
    { enabled = true, class_id = "boot.Iscsi", name = "iscsi-a", interface_name = "iscsi-aaaa", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-a" }) },
  { enabled = true, class_id = "boot.Iscsi", name = "iscsi-b", interface_name = "iscsi-bbbb", object_type = "boot.Iscsi", additional_properties = jsonencode({ port = 0, interfacename = "iscsi-b" }) }]
  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }
}
