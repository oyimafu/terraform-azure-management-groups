module "management_groups" {
  source = "./modules/management-groups"

  tenant_root_group_id = var.tenant_root_group_id
  prefix               = var.prefix

  management_groups = {
    platform = {
      display_name               = "${var.prefix}-platform"
      parent_management_group_id = var.tenant_root_group_id
      subscription_ids           = var.platform_subscription_ids
    }

    landing_zones = {
      display_name               = "${var.prefix}-landing-zones"
      parent_management_group_id = var.tenant_root_group_id
      subscription_ids           = []
    }

    sandbox = {
      display_name               = "${var.prefix}-sandbox"
      parent_management_group_id = var.tenant_root_group_id
      subscription_ids           = var.sandbox_subscription_ids
    }

    decommissioned = {
      display_name               = "${var.prefix}-decommissioned"
      parent_management_group_id = var.tenant_root_group_id
      subscription_ids           = []
    }

    ai = {
      display_name               = "${var.prefix}-ai"
      parent_management_group_id = "landing_zones"
      subscription_ids           = var.ai_subscription_ids
    }
  }
}
