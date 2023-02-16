variable "region"{
  default = "ap-northeast-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "cidr_blocks" {
  default = "0.0.0.0/0"
}

variable "egress_port" {
  default = 0
}

# list type variable
variable "sg_ports" {
  default = [22,80,443,8080]
  type = list
}

# map type variable
variable "custom_tags"{
  default = {
    NAME = "webserver"
    Env = "Development"
    Owner = "Rnstech"
  }
}
