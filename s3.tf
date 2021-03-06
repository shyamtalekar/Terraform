variable "bucket-name" {
  type    = string
  default = "shyamtalekar-development-bucket-110"
}


resource "aws_s3_bucket" "dev-bucket" {
  bucket = var.bucket-name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev-bucket" {
  bucket = aws_s3_bucket.dev-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "dev-bucket" {
  bucket = aws_s3_bucket.dev-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "dev-bucket-policy" {
  bucket = aws_s3_bucket.dev-bucket.id

  policy = <<EOF
{
  "Id": "Policy1655170839087",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1655170827079",
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Resource": "aws_s3_bucket.dev-bucket.arn",
      "Principal": {
        "AWS": [
          "ec2.amazonaws.com"
        ]
      }
    }
  ]
}
EOF
}

resource "aws_s3_object" "object" {
  bucket = var.bucket-name
  key    = "someconfig.zip"
  source = "path/to/file"
}
