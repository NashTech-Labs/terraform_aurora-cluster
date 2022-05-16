vpc_id = "xxxxxxxxxxx"
subnets = ["xxxxxxxxxxx", "xxxxxxxxxxx", "xxxxxxxxxxx", "xxxxxxxxxxx"]
subnet_group = "aurora-subnets"
vpc_security_group_ids = ["xxxxxxxxxxx"]
region = "us-east-1"
access_key = ""
secret_key = ""
availability_zones =["us-east-1a","us-east-1b","us-east-1c","us-east-1d"]
allowed_cidr_blocks    = ["xxxxxxxxxxx"]

cluster_name = "prod-cluster"
instance_class = "xxxxxxxxxxx"

predefined_metric_type = "RDSReaderAverageCPUUtilization"

monitoring_role_arn = "xxxxxxxxxxx"
monitoring_interval = 60

preferred_maintenance_window = "xxxxxxxxxxx"
preferred_backup_window = "xxxxxxxxxxx"
updates_apply_immediately = true
skip_final_snapshot = true
auto_minor_version_upgrade = false

performance_insights_enabled = true
performance_insights_kms_key_id = "xxxxxxxxxxx"
performance_insights_retention_period = 7
backup_retention_period = 7

kms_key_id = "xxxxxxxxxxx"
master_username = "postgres"


