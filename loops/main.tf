resource "aws_instance" "demo" {
  count = 10
}