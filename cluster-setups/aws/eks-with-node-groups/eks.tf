module "EKS" {
  source          = "github.com/linuxautomations/terraform-modules.git//eks-node-groups"
  PURPOSE         = "sample"
  PUBLIC_SUBNETS  = module.VPC.PUBLIC_SUBNETS
  KEYPAIR_NAME    = "sriharsha"
  INSTANCE_TYPE   = "c5.large"
  INSTANCE_COUNT  = 2
}