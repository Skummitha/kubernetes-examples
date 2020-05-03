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
  security_groups = [aws_security_group.allow_nfs.id]
}



resource "aws_security_group" "allow_nfs" {
  name        = "allow_nfs"
  description = "Allow NFS"
  vpc_id      = module.VPC.VPC_ID

  ingress {
    description = "allow_nfs"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [module.VPC.VPC_CIDR]
  }

  tags = {
    Name = "allow_nfs"
  }
}


// Mount EFS
resource "null_resource" "mount_efs" {
  count = length(data.aws_instances.nodes.public_ips)

  provisioner "remote-exec" {

    connection {
      user = "ec2-user"
      host = element(data.aws_instances.nodes.public_ips, count.index)
      private_key = file("/home/centos/.ssh/id_rsa")
    }

    inline = [
      "sudo yum install -y amazon-efs-utils",
      "sudo mkdir -p /data"
      "sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.shared-volume-eks.dns_name}:/ /data"
    ]

  }
}