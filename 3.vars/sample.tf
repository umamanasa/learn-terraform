#Plain Variables
variable "fruit_name" {
  default = "apple"
}
output "fruit_name" {
  value = var.fruit_name
}

#List Variables
variable "fruits" {
  default = [
    "apple",
    "banana"
  ]
  # default = [ "apple", "banana" ]
}

#Map Variable, Plain
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 50
  }
}

#Map Variable, Map of maps
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
  }
    banana = {
      stock = 50
      price = 1
    }
  }
}
output "fruit_stock_with_price" {
  value = var.fruit_stock_with_price
}

#Access a List Variable, List Index starts from ZERO
output "fruits_first" {
  value = "vars.fruits[0]"
}
output "fruits_second" {
  value = "vars.fruits[1]"
}
