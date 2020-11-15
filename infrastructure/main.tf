terraform {
  backend "pg" {
  }

  required_providers {
    heroku = {
      source = "heroku/heroku"
    }
  }
}

provider "heroku" {
  version = ">= 0.13"
}

resource "heroku_app" "default" {
  name   = "cw-ginventory"
  region = "eu"
}

resource "heroku_addon" "database" {
  app  = heroku_app.default.name
  plan = "heroku-postgresql:hobby-dev"
}
