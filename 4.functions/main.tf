variable "frits" {
  default = [ "apple", "banana" ]
}
output "fruits" {
  value = var.fruits[2]
}

