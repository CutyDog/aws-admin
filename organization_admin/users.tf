variable "fukushima_taishi" { type = object({ email = string }) }
variable "hattori_yuta" { type = object({ email = string }) }
variable "kobayashi_ryota" { type = object({ email = string }) }

locals {
  users = {
    fukushima_taishi = {
      given_name  = "taishi"
      family_name = "fukushima"
      email       = var.fukushima_taishi.email
    }
    hattori_yuta = {
      given_name  = "yuta"
      family_name = "hattori"
      email       = var.hattori_yuta.email
    }
    kobayashi_ryota = {
      given_name  = "ryota"
      family_name = "kobayashi"
      email       = var.kobayashi_ryota.email
    }
  }
}