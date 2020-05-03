resource "aws_efs_file_system" "shared-volume-eks" {
  creation_token = local.EFS_NAME

  tags = {
    Name = local.EFS_NAME
  }
}