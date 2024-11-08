variable "url" {  #declare a variable
  default = "prudhvi"
}

## Access a variable
output "URL" {
  value = "var.URL"
}