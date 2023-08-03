# Functions in Terraform
variable "fruits" {
  default = [ "apple", "banana" ]
}
output "fruits" {
#  value = var.fruits[2]
  value = element(var.fruits, 2 )
}

