provider "kubernetes" {
  config_path            = "~/.kube/config"
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = module.project_eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.project_eks.cluster_id
}

module "project_eks" {
  source             = "./modules/eks"
  name               = local.name
  account            = data.aws_caller_identity.current.account_id
  ec2_sg             = module.project_ec2.ec2_sg
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  # private_subnet_ids = ["subnet-07787680d865ad85b", "subnet-039dc13df4b5e683a"]
  # vpc_id             = "vpc-0f94baecba103d0ef"
  nodes_desired_size = 2
  nodes_max_size     = 2
  nodes_min_size     = 1
  instance_policy    = data.aws_iam_policy.instance-policy
  cloudwatch_policy  = data.aws_iam_policy.cloudwatch-policy
  cluster_role       = data.aws_iam_role.eks_cluster_role
  node_role          = data.aws_iam_role.eks_node_role
}
