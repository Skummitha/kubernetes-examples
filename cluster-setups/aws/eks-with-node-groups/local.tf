locals {
  NODES = tolist(data.aws_instances.nodes.public_ips)
  EFS_NAME = "${var.PURPOSE}-efs"
}