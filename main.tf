# CLO835 - Final Project Infrastructure Code

#  Define the provider
provider "aws" {
  region = "us-east-1"
}

# Create AWS ECR repository to store webapp images
resource "aws_ecr_repository" "webapp_repo" {
  name                 = "clo835-final-webapp-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Create AWS ECR repository to store MYSQL images
resource "aws_ecr_repository" "mysql_repo" {
  name                 = "clo835-final-mysql-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# Create AWS ECR repository to store background images
resource "aws_s3_bucket" "background_bucket" {
  bucket = "clo835-final-group9-background-bucket"

  tags = {
    Name        = "Background Image"
    Environment = "Dev"
  }
}