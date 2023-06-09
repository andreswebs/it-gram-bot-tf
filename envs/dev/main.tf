data "aws_region" "current" {}

module "telegram_bot" {
  source             = "../../modules/telegram-bot"
  service_name       = "imateapot-bot-dev"
  api_stage          = "dev"
  lambda_image_param = var.lambda_image_param
  bot_token_param    = var.bot_token_param
  secret_token_param = var.secret_token_param
}
