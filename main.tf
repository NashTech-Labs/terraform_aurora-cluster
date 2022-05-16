
module "aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "6.1.3"

  name           = "${var.cluster_name}"
  engine         = "aurora-postgresql"
  engine_version = "13.3"
  # availability_zones = "${var.availability_zones}"
  instance_class = "${var.instance_class}"
  instances = { 
      instances-1 = {
        identifier     = "${var.cluster_name}-instances-1"
        instance_class = "${var.instance_class}"
        promotion_tier = 0
        performance_insights_enabled = "${var.performance_insights_enabled}"
        performance_insights_kms_key_id = "${var.performance_insights_kms_key_id}"
        performance_insights_retention_period = "${var.performance_insights_retention_period}"
      }
      instances-2 = {
        identifier     = "${var.cluster_name}-instances-2"
        instance_class = "${var.instance_class}"
        promotion_tier = 0
        performance_insights_enabled = "${var.performance_insights_enabled}"
        performance_insights_kms_key_id = "${var.performance_insights_kms_key_id}"
        performance_insights_retention_period = "${var.performance_insights_retention_period}"
      }
    }

  kms_key_id = "${var.kms_key_id}"
  master_username = "${var.master_username}"
  master_password = "${var.master_password}"
  create_random_password = false
  auto_minor_version_upgrade = "${var.auto_minor_version_upgrade}"

  vpc_id                 = "${var.vpc_id}"
  subnets                = "${var.subnets}"
  db_subnet_group_name   = "${var.subnet_group}"
  create_db_subnet_group = true
  create_security_group  = false
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  allowed_cidr_blocks    = "${var.allowed_cidr_blocks}"
  port = "5432"
  predefined_metric_type = "${var.predefined_metric_type}"

  create_monitoring_role = false
  monitoring_role_arn = "${var.monitoring_role_arn}"
  monitoring_interval = "${var.monitoring_interval}"

  apply_immediately   = "${var.updates_apply_immediately}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
  preferred_maintenance_window = "${var.preferred_maintenance_window}"
  preferred_backup_window = "${var.preferred_backup_window}"
  backup_retention_period = "${var.backup_retention_period}"

  db_parameter_group_name         = aws_db_parameter_group.dbparam.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.clusterparam.id
  enabled_cloudwatch_logs_exports = ["postgresql"]

}

resource "aws_db_parameter_group" "dbparam" {
  name = "${var.cluster_name}-db-parameter-group"
  family      = "aurora-postgresql13"
  description = "${var.cluster_name}-db-parameter-group"
}

resource "aws_rds_cluster_parameter_group" "clusterparam" {
  name = "${var.cluster_name}-cluster-parameter-group"
  family      = "aurora-postgresql13"
  description = "${var.cluster_name}-cluster-parameter-group"
}

/*
backend configs
*/
provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}