resource "aws_instance" "frontend" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}




#output "test" {
#  value = "Hello"
#}