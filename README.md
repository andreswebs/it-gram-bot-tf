# it-gram-bot-tf

Infrastructure for the `it-gram-bot` built with Terraform.

## Set webhook

```sh
curl -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/setWebhook?url=${WEBHOOK_URL}&secret_token=${TELEGRAM_BOT_SECRET}"
```

The `TELEGRAM_BOT_SECRET` must be 1-256 characters, only characters A-Z, a-z,
0-9, _ and - are allowed.

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
