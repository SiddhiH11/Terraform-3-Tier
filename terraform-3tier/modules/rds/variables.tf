variable "env" {}
variable "private_subnets" {
  type = list(string)
}
variable "db_username" {}
variable "db_password" {}
variable "db_instance_class" {}