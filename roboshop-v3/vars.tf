variable "security_groups" {
  default   = [ "sg-041096a23e28b0eb0" ]
}

variable "zone_id" {
  default   = "Z0365188L7MG2LV8YN4J"
}

variable "components" {
  default = {
    frontend = {
      name            = "frontend"
      instance_type   = "t3.micro"
    }

    mongodb = {
      name            = "mongodb"
      instance_type   = "t3.micro"
    }

    catalogue = {
      name            = "catalogue"
      instance_type   = "t3.micro"

    }

    redis = {
      name            = "redis"
      instance_type   = "t3.micro"
    }

    user = {
      name            = "user"
      instance_type   = "t3.micro"
    }

    cart = {
      name            = "cart"
      instance_type   = "t3.micro"
    }

    mysql = {
      name            = "mysql"
      instance_type   = "t3.micro"
    }

    shipping = {
      name            = "shipping"
      instance_type   = "t3.micro"
    }

    rabbitmq = {
      name            = "rabbitmq"
      instance_type   = "t3.micro"
    }

    payment = {
      name            = "payment"
      instance_type   = "t3.micro"
    }

    dispatch = {
      name            = "dispatch"
      instance_type   = "t3.micro"
    }

  }
}

