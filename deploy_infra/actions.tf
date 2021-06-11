#This file has 2 configuration blocks.
#Block-1  - Will Deploy server profiles to server
#Block-2  - Will Unassign server profile already assigned.

#Select which block you like to perform by
#UnCommment this block if want to Deploy a server profile figuration
resource "intersight_server_profile" "Deploy-Server-Profile" {
  for_each        = local.server_moid_to_profile_mapping
  name            = each.value
  target_platform = "FIAttached"

  action = var.action

  organization {
    object_type = "organization.Organization"
    moid        = module.org_details.org_moid
  }
}