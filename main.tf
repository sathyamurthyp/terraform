provider "aws" {
  region  = "us-west-2" # Change this to your desired region.
}

resource "aws_instance" "example" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
