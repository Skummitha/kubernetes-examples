resource "aws_efs_file_system" "shared-volume-eks" {
  creation_token = local.EFS_NAME

  tags = {
    Name = local.EFS_NAME
  }
}

resource "aws_efs_mount_target" "public" {
  count           = length(module.VPC.PUBLIC_SUBNETS)
  file_system_id  = aws_efs_file_system.shared-volume-eks.id
  subnet_id       = element(module.VPC.PUBLIC_SUBNETS, count.index)
}