resource "aws_instance" "rns-ec2" {
    ami          = "ami-06ee4e2261a4dc5c3"
    instance_type= "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = file("./scripts/install_httpd.sh")

                 user_data_replace_on_change = true

    tags  =  {
             Name= "web-server"
             Env = "Development"
    }
}

resource "aws_security_group" "instance" {
  name        = "ec2-example-instance"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
     from_port       = 22
     to_port         = 22
     protocol        = "tcp"
     cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
