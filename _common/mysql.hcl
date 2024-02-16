
terraform {
  #source = "${local.base_source_url}?ref=v0.7.0"
  source = "../modules//mysql"1
}

locals {

  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment
  #base_source_url = "git::git@github.com:gruntwork-io/terragrunt-infrastructure-modules-example.git//mysql"
}
inputs = {
  name              = "mysql_${local.env}"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  storage_type      = "standard"
  master_username   = "admin"
  # TODO: To avoid storing your DB password in the code, set it as the environment variable TF_VAR_master_password
}
