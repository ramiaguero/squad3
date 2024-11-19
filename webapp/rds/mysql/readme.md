## Description

This module provides an Aurora MySQL Cluster, fully functional to be immediately added to your project

## Resources

By adding this module to your project, you will create the following resources:

  - An Aurora MySQL Cluster
  - A Cluster Parameter Group
  - A Parameter Group
  - A Security Group

  

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "mydb" {
  source           = "../modules/data/rds"
  subnets          = var.mysubnets
  identifier       = "my-cluster"
  db_engine        = "aurora-mysql"
  db_username      = "username"
  db_passord_ssm_param =
  db_name          = "my_prod_db"
  engine_version   = "5.7.mysql_aurora.2.03.2"
  vpc_id           = "vpc-1111111111111"
  sec_group        = "sg-111111111111"
  region           = "us-east-1"
  db_instance_type = "db.t3.medium"
  reader_nodes     = 1
  is_public        = true
}

```

## Inputs

| Name                 | Description                                                                                                    |     Type     |        Default         | Required |
| -------------------- | -------------------------------------------------------------------------------------------------------------- | :----------: | :--------------------: | :------: |
| subnets              | List of subnet IDs to use                                                                                      | list(string) |           -            |   yes    |
| identifier           | Name of the cluster                                                                                            |    string    |           -            |   yes    |
| db_engine            | Aurora database engine type, currently aurora, aurora-mysql or aurora-postgresql                               |    string    |      aurora-mysql      |    no    |
| db_username          | Master DB username                                                                                             |    string    |           -            |   yes    |
| db_passord_ssm_param | SSM parameter that stores the rds root password                                                                |    string    |           -            |
| db_name              | Name for an automatically created database on cluster creation                                                 |    string    |           -            |   yes    |
| engine_version       | Aurora database engine version                                                                                 |    string    |           -            |   yes    |
| vpc_id               | The VPC ID                                                                                                     |    string    |           -            |   yes    |
| cidr_block           | A list of CIDR blocks to allow access to                                                                       | list(string) |           -            |   yes    |
| region               | Amazon region                                                                                                  |    string    |           -            |   yes    |
| db_instance_type     | Instance type to use in the cluster                                                                            |    string    |      db.t3.medium      |    no    |
| kms_key              | The ARN for the KMS encryption key if one is set to the cluster                                                |    string    |           ""           |    no    |
| reader_nodes         | Number of reader nodes to create. Ifreplica_scale_enable istrue, the value ofreplica_scale_min is used instead |    string    |          "0"           |    no    |
| is_public            | Whether the DB should have a public IP address                                                                 |   Boolean    |         false          |    no    |
| skip_final_snapshot  | Should a final snapshot be created on cluster destroy                                                          |   boolean    |         false          |    no    |
| tags                 | Tags to be applied to the RDS                                                                                  |     map      | { terraform = "true" } |    no    |


## Outputs

| Name              | Description                       |
| ----------------- | --------------------------------- |
| rds_endpoint      | The Aurora Cluster Endpoint       |
| security_group_id | The rds cluster security group id |
