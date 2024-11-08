terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
variable "instances" {
  default = [
    "frontend",
    "mongodb",
    "user",
    "catalogue",
    "redis",
    "shipping",
    "payment",
    "rabbitmq",
    "mysql",
    "cart",
    ]

}

resource "aws_instance" "instance" {
  count = length(var.instances)
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0b308c7134616a7ce"]
  tags ={
    Name = "var.instances[count.index]"
  }
}

resource "aws_route53_record" "record" {
  count = length(var.instances)
  name    = "$(var.instances[count.index]).dev.devops11.online"
  type    = "A"
  zone_id = "Z01439081N47RAIJCUHEJ"
  ttl     = "30"
  records = [aws_instance.instance[count.index].private_ip]
}