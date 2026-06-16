resource "aws_db_subnet_group" "sub_grp" {
  name       = "mydbsubnet"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}





resource "aws_db_instance" "default" {
  allocated_storage = var.allocated_storage
  db_name           = var.db_name

  engine                 = "mysql"
  engine_version         = "8.0"
  db_subnet_group_name   = aws_db_subnet_group.sub_grp.name
  vpc_security_group_ids = [var.sg_id]

  instance_class = var.instance_class

  username = var.db_username
  password = var.db_password

  parameter_group_name = "default.mysql8.0"

  multi_az                = false
  publicly_accessible     = true
  skip_final_snapshot     = true
  deletion_protection     = false
  backup_retention_period = 0
  maintenance_window = "Mon:00:00-Mon:03:00"
}