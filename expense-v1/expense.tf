resource "aws_instance" "frontend" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]

  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z0365188L7MG2LV8YN4J"
  name    = "frontend-dev.manasareddy.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]

  tags = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z0365188L7MG2LV8YN4J"
  name    = "mysql-dev.manasareddy.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}


resource "aws_instance" "backend" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]

  tags = {
    Name = "backend"
  }
}
resource "aws_route53_record" "backend" {
  zone_id = "Z0365188L7MG2LV8YN4J"
  name    = "backend-dev.manasareddy.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.backend.private_ip]
}
