# Terraform Azure Management Groups

Terraform starter for establishing an Azure landing zone foundation focused on:

- Management group hierarchy
- Subscription association
- No resource provisioning yet

## Scope

This repository intentionally focuses on governance structure first. It helps a new Azure client define and deploy:

- Parent and child management groups
- Subscription placement into the correct management groups
- A reusable Terraform structure that can later be extended with policy, RBAC, and workload landing zones

## Repository structure

```text
.
├── README.md
├── versions.tf
├── providers.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
└── modules/
    └── management-groups/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Prerequisites

- Terraform >= 1.6.0
- Azure permissions to create management groups and move subscriptions
- An identity with access at the tenant or management group scope

## Usage

1. Copy the example variable file:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Update values in `terraform.tfvars`.

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Review the plan:

   ```bash
   terraform plan
   ```

5. Apply when ready:

   ```bash
   terraform apply
   ```

## Notes

- `tenant_root_group_id` should be the management group ID used as the parent anchor.
- Child management groups can be nested under either the tenant root group or another group declared in this configuration.
- This repo does not provision Azure resources yet; it only establishes the governance hierarchy.

## Next steps

Later, this foundation can be extended with:

- Azure Policy assignments
- Role assignments
- Logging and diagnostics baselines
- Network and workload landing zones
- Environment-specific hierarchies
