locals {
  parameters_prefix = var.parameters_prefix
  parameters = var.parameters
}

resource "aws_ssm_parameter" "this" {
  for_each      = local.parameters
  name  = "${local.parameters_prefix}/${each.key}"
  value = each.value.value
  type  = each.value.type

  lifecycle {
      ignore_changes = [
        value
      ]
    }
}