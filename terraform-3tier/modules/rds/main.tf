resource "aws_db_subnet_group" "rds_subnet" {
  name       = "${var.env}-rds-subnet"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "db" {
  identifier           = "${var.env}-db"
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  skip_final_snapshot  = true
  publicly_accessible  = false
}