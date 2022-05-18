module "ssm_variables" {
  source  = "github.com/silksh-terraform-modules/terraform-aws-ssm-variables?ref=v0.0.1"

  parameters_prefix = "/${var.env_name}/example-app"

  parameters = {
    "FIRST_VARIABLE" = { value = "some_value", type = "String" },
    "SECOND_VARIABLE" = { value = var.secret_value, type = "SecureString" },
    "DATASOURCE_URL" = { value = "jdbc:postgresql://${module.main_db.db_instance_endpoint}/${var.rds_db_name}", type = "String" }
  }
}