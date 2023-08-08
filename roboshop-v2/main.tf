variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  default = "t3.small"
}

variable "security_group_ids" {
  default = [ "sg-041096a23e28b0eb0" ]
}

variable "zone_id" {
  default = "Z0365188L7MG2LV8YN4J"
}

variable "components" {
  default = {
    frontend = { name = "frontend-dev" }
    mongodb = { name = "mongodb-dev" }
    catalogue = { name = "catalogue-dev" }
    redis = { name = "redis-dev" }
    user = { name = "user-dev" }
    cart = { name = "cart-dev" }
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev" }
    payment = { name = "payment-dev" }
    rabbitmq = { name = "rabbitmq-dev" }
    dispatch = { name = "dispatch-dev" }
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value, "name", null)}.manasareddy.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null) ]
}

output "instances" {
  value = aws_instance.instance
}

