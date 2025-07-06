
resource "random_password" "db" {
  length           = 16
  special          = true
  override_special = "!#$%&*-" # avoids quotes and slashes
}

resource "aws_secretsmanager_secret" "db" {
  name        = "${var.project}-db-admin-credentials"
  description = "RDS admin credentials for ${var.project}"
}


resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.db.result
    host     = aws_db_instance.this.address
    port     = aws_db_instance.this.port
    dbname   = var.db_name
  })
  depends_on = [aws_db_instance.this]
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project}-db-subnet-group"
  }
}


resource "aws_security_group" "db" {
  name        = "${var.project}-db-sg"
  description = "Allow ${var.db_engine} traffic from backend SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "App-to-DB"
    protocol        = "tcp"
    from_port       = var.db_engine == "mysql" ? 3306 : 5432
    to_port         = var.db_engine == "mysql" ? 3306 : 5432
    security_groups = [var.allowed_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-db-sg"
  }
}


resource "aws_db_instance" "this" {
  identifier             = "${var.project}-db"
  allocated_storage      = 20
  engine                 = var.db_engine
  engine_version         = var.engine_version
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = "admin"
  password               = random_password.db.result
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "${var.project}-db"
  }
}
