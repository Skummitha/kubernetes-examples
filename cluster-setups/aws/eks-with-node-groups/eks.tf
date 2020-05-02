module "VPC" {
  source          = "github.com/linuxautomations/terraform-modules.git//eks-node-groups"
  PURPOSE         = "sample"
  PUBLIC_SUBNETS  = module.VPC.PUBLIC_SUBNETS
}