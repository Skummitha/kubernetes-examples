module "VPC" {
  source        = "github.com/linuxautomations/terraform-modules.git//vpc"
  VPC_CIDR      = "10.233.0.0/16"
  PURPOSE       = "sample"
}