module "telegram_bot" {
  source             = "../../modules/telegram-bot"
  function_dir       = "../../../app"
  service_name       = "telegram-bot"
  bot_token_param    = var.bot_token_param
  secret_token_param = var.secret_token_param
}
