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
    cart = {
      name            = "cart"
      instance_type   = "t3.micro"
    }
  }
}

