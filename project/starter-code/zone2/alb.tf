module "project_alb" {
  source = "./modules/alb"
  #   ec2       = [for instance in module.project_ec2.aws_instances : ubuntu.id]
  ec2    = module.project_ec2.aws_instance
  ec2_sg = module.project_ec2.ec2_sg
  # subnet_id = module.vpc.public_subnet_ids
  # vpc_id    = module.vpc.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  vpc_id    = data.terraform_remote_state.vpc.outputs.vpc_id
  # subnet_id = ["subnet-092ed720561b467d9", "subnet-0f50a3af5e185a112"]
  # vpc_id    = "vpc-0f94baecba103d0ef"
}
