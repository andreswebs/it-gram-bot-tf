locals {
  ssm_param_arn_prefix   = "arn:${local.aws_partition}:ssm:${local.region}:${local.account_id}:parameter"
  bot_token_param_arn    = "${local.ssm_param_arn_prefix}${var.bot_token_param}"
  secret_token_param_arn = "${local.ssm_param_arn_prefix}${var.secret_token_param}"
}

data "aws_ssm_parameter" "lambda_image" {
  name            = var.lambda_image_param
  with_decryption = true
}

module "lambda" {
  source             = "andreswebs/lambda-container/aws"
  version            = "3.1.0"
  lambda_image_uri   = data.aws_ssm_parameter.lambda_image.value
  lambda_name_prefix = var.service_name
  lambda_description = var.service_description
  lambda_memory_size = 2048
  lambda_timeout     = 600

  lambda_env_vars = {
    SSM_PARAM_TELEGRAM_BOT_TOKEN    = var.bot_token_param
    SSM_PARAM_TELEGRAM_SECRET_TOKEN = var.secret_token_param
    SSM_PARAM_OPENAI_TOKEN          = var.openai_token_param
  }

}

data "aws_iam_policy_document" "lambda_ssm_permissions" {

  statement {
    sid       = "SSMDescribe"
    actions   = ["ssm:DescribeParameters"]
    resources = ["*"]
  }

  statement {
    sid = "SSMGet"

    actions = [
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:GetParameterHistory",
    ]

    resources = [
      local.bot_token_param_arn,
      local.secret_token_param_arn,
    ]
  }

}

resource "aws_iam_role_policy" "lambda_ssm_permissions" {
  name   = "ssm-permissions"
  role   = module.lambda.role.id
  policy = data.aws_iam_policy_document.lambda_ssm_permissions.json
}
