variable "bot_token_param" {
  type        = string
  description = "Name of the SSM parameter storing the Bot API token"
  default     = "/telegram-bot/token"
}

variable "secret_token_param" {
  type        = string
  description = "Name of the SSM parameter storing the Bot secret token"
  default     = "/telegram-bot/secret"
}
