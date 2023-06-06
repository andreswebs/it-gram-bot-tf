variable "bot_token_param" {
  type        = string
  description = "Name of the SSM parameter storing the Bot API token"
}

variable "secret_token_param" {
  type        = string
  description = "Name of the SSM parameter storing the Bot secret token"
}
