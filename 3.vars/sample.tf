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
#output "fruit_stock_with_price" {
#  value = var.fruit_stock_with_price
#}

#Access a List Variable, List Index starts from ZERO
output "fruits_first" {
  value = var.fruits[0]
}
output "fruits_second" {
  value = var.fruits[1]
}

#Access a Map Variable
output "fruits_stock_apple" {
  value = var.fruit_stock[ "apple" ]
}
output "fruits_stock_banana" {
  value = var.fruit_stock[ "banana" ]
}