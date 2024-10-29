# `sg_rules` Folder Documentation

## Overview
The `sg_rules` folder contains Terraform configuration files to create and manage rules for an existing AWS Security Group.

## Files
* `sg_rules.tf`: Main configuration file for the Security Group Rule resource.
* `variables.tf`: Defines variables used in `sg_rules.tf` to parameterize the Security Group Rule configuration.

## Variables
The following variables are defined in `variables.tf`:

| Variable | Type | Description |
|----------|------|-------------|
| `sg_id` | string | ID of the Security Group to apply the rule to. |
| `type` | string | Type of rule (ingress or egress). |
| `from_port` | number | Starting port for the rule. |
| `to_port` | number | Ending port for the rule. |
| `protocol` | string | Protocol for the rule (e.g., `tcp`, `udp`, `-1` for all). |
| `cidr_blocks` | list(string) | List of CIDR blocks to define the rule's scope. |
| `description` | string | Description of the rule. |

## Usage
1. Define the variables in your Terraform code or provide them via a `terraform.tfvars` file.
2. Ensure the `sg_id` variable matches the Security Group ID where the rule should apply.
3. Run `terraform apply` to create the Security Group Rule.
