I'll help you format this documentation in Markdown for GitHub:

# `sg` Folder Documentation

## Overview
The `sg` folder contains Terraform configuration files to create and manage an AWS Security Group.

## Files
* `sg.tf`: Main configuration file for the Security Group resource.
* `variables.tf`: Defines variables used in `sg.tf` to parameterize the Security Group configuration.
* `outputs.tf`: Outputs the Security Group ID and name for use in other parts of the infrastructure.

## Variables
The following variables are defined in `variables.tf`:

| Variable | Type | Description |
|----------|------|-------------|
| `name` | string | Name of the Security Group. |
| `vpc_id` | string | VPC ID where the Security Group will be created. |
| `environment` | string | Environment tag for the Security Group (e.g., `dev`, `prod`). |
| `project` | string | Project name for tagging the Security Group. |

## Outputs
The following outputs are defined in `outputs.tf`:

| Output | Description |
|--------|-------------|
| `sg_id` | The ID of the created Security Group. |
| `sg_name` | The name of the created Security Group. |

## Usage
1. Define the variables in your Terraform code or provide them via a `terraform.tfvars` file.
2. Run `terraform apply` to create the Security Group.
3. The created Security Group's ID and name will be available as outputs.
