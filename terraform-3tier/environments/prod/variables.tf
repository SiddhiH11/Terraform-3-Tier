variable "region" {}
variable "env" {}
variable "vpc_cidr" {}
variable "azs" {
  type = list(string)
}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" {}