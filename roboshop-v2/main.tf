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

#resource "aws_instance" "mongodb" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "mongodb"
#  }
#}
#
#resource "aws_route53_record" "mongodb" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "mongodb-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mongodb.private_ip]
#}
#
#resource "aws_instance" "catalogue" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "catalogue"
#  }
#}
#
#resource "aws_route53_record" "catalogue" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "catalogue-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.catalogue.private_ip]
#}
#
#resource "aws_instance" "redis" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "redis"
#  }
#}
#
#resource "aws_route53_record" "redis" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "redis-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.redis.private_ip]
#}
#
#resource "aws_instance" "user" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "user"
#  }
#}
#
#resource "aws_route53_record" "user" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "user-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.user.private_ip]
#}
#
#resource "aws_instance" "cart" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "cart"
#  }
#}
#
#resource "aws_route53_record" "cart" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "cart-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.cart.private_ip]
#}
#
#resource "aws_instance" "mysql" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "mysql"
#  }
#}
#
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "mysql-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mysql.private_ip]
#}
#
#resource "aws_instance" "shipping" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "shipping"
#  }
#}
#
#resource "aws_route53_record" "shipping" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "shipping-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.shipping.private_ip]
#}
#
#resource "aws_instance" "rabbitmq" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "rabbitmq"
#  }
#}
#
#resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "rabbitmq-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.rabbitmq.private_ip]
#}
#
#resource "aws_instance" "payment" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "payment"
#  }
#}
#
#resource "aws_route53_record" "payment" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "payment-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.payment.private_ip]
#}
#
#resource "aws_instance" "dispatch" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
#    Name = "dispatch"
#  }
#}
#
#resource "aws_route53_record" "dispatch" {
#  zone_id = "Z0365188L7MG2LV8YN4J"
#  name    = "dispatch-dev.manasareddy.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.dispatch.private_ip]
#}