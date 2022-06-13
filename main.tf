# locals {
#   sg_name = "${var.application}-${var.service}-${var.environment}"
# }

# resource "aws_security_group" "sg" {
#   name        = local.sg_name
#   description = "Test server for testing ansible playbooks."
#   vpc_id      = module.network.vpc_id
#   tags = {
#     Name = local.sg_name
#   }
# } 

# module "ec2-dev" {
#   source             = "git::codecommit://module-aws-ec2-linux?ref=v5"
#   ami_name           = "ami-019599717e2dd5baa" #"alight_rhel85base_1.1.0"
#   instance_type      = "m6i.large"
#   count              = 3
#   vpc_tier           = var.vpc_tier
#   vpc_group          = var.vpc_group
#   security_group_ids = [aws_security_group.sg.id]
#   application        = var.application
#   service            = var.service
#   environment        = var.environment
#   tags               = {}
# }
