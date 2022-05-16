variable "vpc_id" {
  type        = string
}
variable "subnets" {
  type = list(string)
}
variable "region" {
  type        = string
}
variable "access_key" {
  type        = string
}
variable "secret_key" {
  type        = string
}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "allowed_cidr_blocks" {
  type = list(string)
}
variable "subnet_group" {
  type        = string
}


variable "monitoring_role_arn" {
  description = "IAM role used by RDS to send enhanced monitoring metrics to CloudWatch"
  type        = string
  default     = ""
}

variable cluster_name {
  type        = string
}
variable instance_class {
  type        = string
}
variable auto_minor_version_upgrade {
  type        = bool
}

variable "performance_insights_enabled" {
  description = ""
  type        = bool
  default     = false
}
variable performance_insights_kms_key_id {}

variable performance_insights_retention_period {
type = number
default = 7
  validation {
    condition = (
      var.performance_insights_retention_period >= 7 &&
      var.performance_insights_retention_period <= 731
    )
    error_message = "Must be in the time range 7 (7 days) or 731 (2 years), inclusive."
  }
}

variable kms_key_id {
  type        = string
}
variable master_username {
  type        = string
}
variable "master_password" {
  type        = string
}

variable "preferred_maintenance_window" {
  type        = string
}

variable "preferred_backup_window" {
  type        = string
}
variable "backup_retention_period" {
  type        = number
  default     = 7
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for instances. Set to `0` to disble. Default is `0`"
  type        = number
  default     = 0
}
variable "skip_final_snapshot" {
  description = "Determines whether a final snapshot is created before the cluster is deleted. If true is specified, no snapshot is created"
  type        = bool
  default     = null
}

variable "updates_apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is `false`"
  type        = bool
  default     = null
}

variable "availability_zones" {
  type = list(string)
}

variable "autoscaling_scale_in_cooldown" {
  description = "Cooldown in seconds before allowing further scaling operations after a scale in"
  type        = number
  default     = 300
}

variable "autoscaling_scale_out_cooldown" {
  description = "Cooldown in seconds before allowing further scaling operations after a scale out"
  type        = number
  default     = 300
}

variable "autoscaling_target_cpu" {
  description = "CPU threshold which will initiate autoscaling"
  type        = number
  default     = 70
}

variable "autoscaling_target_connections" {
  description = "Average number of connections threshold which will initiate autoscaling. Default value is 70% of db.r4/r5/r6g.large's default max_connections"
  type        = number
  default     = 700
}

variable "predefined_metric_type" {
  description = "The metric type to scale on. Valid values are `RDSReaderAverageCPUUtilization` and `RDSReaderAverageDatabaseConnections`"
  type        = string
  default     = "RDSReaderAverageCPUUtilization"
}
