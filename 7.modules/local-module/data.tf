data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-*"
  owners      = ["973714476881"]
}
output "aws_ami" {
  value = data.aws_ami
}

