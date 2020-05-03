locals {
  NODES = tolist(data.aws_instances.nodes.public_ips)
}