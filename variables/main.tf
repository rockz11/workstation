variable "url" {  #declare a variable
  default = "prudhvi"
}

## Access a variable
output "URL" {
  value = "var.URL"
}
# Variabale is a combination of some other string. Then we have to use ${}
output "URL1" {
  value = "var.url1"
}
# Data types
variable "num1" {
  default = "3"
}
variable "bool1" {
  default = "false"
}
variable "str1" {
  default = "RAJA RAVIVARMA"
}


