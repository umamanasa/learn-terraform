#variable "components" {
#  default = "frontend", "mongodb", "catalogue", "redis"
#}

variable "components" {
  default = {
    frontend = {
    instance_type = "t3.micro"
    }
    mongodb = {
    instance_type = "t3.micro"
    }
    frontend = {
      instance_type = "t3.micro"
    }
  }
}