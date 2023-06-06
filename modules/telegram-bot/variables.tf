variable "service_name" {
  type        = string
  description = "Service name, also used to compose various AWS resource names"
  default     = "it"
}

variable "service_description" {
  type        = string
  description = "Service description"
  default     = "Private Telegram Bot"
}

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

variable "api_stage" {
  type        = string
  description = "API Gateway deployment stage"
  default     = "v1"
}

variable "function_dir" {
  type        = string
  description = "File system path to the directory containing the lambda source code"
}
