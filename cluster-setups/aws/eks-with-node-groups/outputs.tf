output "NODES" {
  value = data.aws_instances.nodes.public_ips
}