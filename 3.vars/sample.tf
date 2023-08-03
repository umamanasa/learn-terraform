#plain variables
variable "fruit_name" {
  default = "apple"
}
output "fruit_name" {
  value = var.fruit_name
}

#list variables
variable "fruits" {
  default = [
    "apple",
    "banana"
  ]
  # default = [ "apple", "banana" ]
}

#map variable, plain
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 50
  }
}

#map variable, map of maps
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