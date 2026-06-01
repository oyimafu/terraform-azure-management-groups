variable "tenant_root_group_id" {
  type = string
}

variable "prefix" {
  type = string
}

variable "management_groups" {
  type = map(object({
    display_name               = string
    parent_management_group_id = string
    subscription_ids           = list(string)
  }))
}
