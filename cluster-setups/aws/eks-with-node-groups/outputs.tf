output "AUTO_SCALING_GROUP_NAME" {
  value = join(module.EKS.AUTO_SCALING_GROUP_NAME.*.autoscaling_groups[*])
}