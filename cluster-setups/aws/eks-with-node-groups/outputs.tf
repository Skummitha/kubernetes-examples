output "AUTO_SCALING_GROUP_NAME" {
  value = module.EKS.AUTO_SCALING_GROUP_NAME[0].autoscaling_groups[0].name
}