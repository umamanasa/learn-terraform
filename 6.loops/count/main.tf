variable "components" {
  default = [ "frontend", "mongodb", "catalogue" ]
}

#resource "aws_instance" "instance" {
#
#  count = length(var.components)
#
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [ "sg-041096a23e28b0eb0" ]
#
#  tags = {
##   Name = var.components[count.index]
#    Name = element(var.components, count.index)
#  }
#}

resource "aws_security_group" "allow_tls" {
  count = length(var.components)
  name        = element(var.components, count.index)
}