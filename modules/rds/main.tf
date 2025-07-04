resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "this" {
  identifier              = "${var.project}-db"
  allocated_storage       = 20
  engine                  = var.db_enginea
  instance_class          = "db.t3.micro"
  name                    = var.db_name
  username                = "admin"
  password                = "changeme1234"
  db_subnet_group_name    = aws_db_subnet_group.this.name
  skip_final_snapshot     = true
  publicly_accessible     = false
}

output "db_endpoint" { value = aws_db_instance.this.endpoint }
