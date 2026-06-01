variable "subscription_id" {
  description = "Azure subscription ID used by the provider for authentication context."
  type        = string
}

variable "tenant_root_group_id" {
  description = "Tenant root management group ID or parent management group ID."
  type        = string
}

variable "prefix" {
  description = "Prefix used in management group display names."
  type        = string
  default     = "alz"
}

variable "platform_subscription_ids" {
  description = "Subscriptions to associate with the platform management group."
  type        = list(string)
  default     = []
}

variable "sandbox_subscription_ids" {
  description = "Subscriptions to associate with the sandbox management group."
  type        = list(string)
  default     = []
}

variable "ai_subscription_ids" {
  description = "Subscriptions to associate with the AI management group."
  type        = list(string)
  default     = []
}
