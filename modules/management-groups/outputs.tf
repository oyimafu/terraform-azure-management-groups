output "management_group_ids" {
  value = {
    for k, v in azurerm_management_group.this : k => v.id
  }
}

output "management_group_display_names" {
  value = {
    for k, v in azurerm_management_group.this : k => v.display_name
  }
}
