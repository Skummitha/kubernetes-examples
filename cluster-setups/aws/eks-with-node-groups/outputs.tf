output "AUTO_SCALING_GROUP_NAME" {
  value = module.EKS.AUTO_SCALING_GROUP_NAME.*.autoscaling_groups[*]
}