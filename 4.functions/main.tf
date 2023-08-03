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
  value = var.fruits_with_stock["banana"]
}


