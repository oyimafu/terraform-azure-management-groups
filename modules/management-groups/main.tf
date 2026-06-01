locals {
  subscription_associations = flatten([
    for mg_key, mg in var.management_groups : [
      for sub_id in mg.subscription_ids : {
        management_group_key = mg_key
        subscription_id      = sub_id
      }
    ]
  ])
}

resource "azurerm_management_group" "this" {
  for_each = var.management_groups

  name         = each.key
  display_name = each.value.display_name

  parent_management_group_id = contains(keys(var.management_groups), each.value.parent_management_group_id)
    ? azurerm_management_group.this[each.value.parent_management_group_id].id
    : "/providers/Microsoft.Management/managementGroups/${var.tenant_root_group_id}"
}

resource "azurerm_management_group_subscription_association" "this" {
  for_each = {
    for item in local.subscription_associations :
    "${item.management_group_key}-${item.subscription_id}" => item
  }

  management_group_id = azurerm_management_group.this[each.value.management_group_key].id
  subscription_id     = "/subscriptions/${each.value.subscription_id}"
}
