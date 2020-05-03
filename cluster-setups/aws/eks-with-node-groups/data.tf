data "aws_autoscaling_group" "asg" {
  name = module.EKS.AUTO_SCALING_GROUP_NAME[0].autoscaling_groups[0].name
}

data "aws_instances" "nodes" {

  filter {
    name   = "aws:autoscaling:groupName"
    values = [module.EKS.AUTO_SCALING_GROUP_NAME[0].autoscaling_groups[0].name]
  }

  instance_state_names = ["running"]
}