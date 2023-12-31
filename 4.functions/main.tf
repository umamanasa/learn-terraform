# Functions in Terraform
variable "fruits" {
  default = [ "apple", "banana" ]
}
output "fruits" {
#  value = var.fruits[2]
  value = element(var.fruits, 2 )
}

variable "fruits_with_stock" {
  default = {
    apple = 100
  }
}
output "fruits_stock" {
  value = try(var.fruits_with_stock["banana"],0)
}
output "fruits_stock_price" {
  value = lookup(var.fruits_with_stock["apple"], "price", 2)
}

