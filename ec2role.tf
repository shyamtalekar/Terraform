data "aws_iam_policy_document" "ec2-bucket-read-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2-bucket-read-role" {
  name               = "ec2-bucket-read-role"
  assume_role_policy = data.aws_iam_policy_document.ec2-bucket-read-role.json
}

resource "aws_iam_role_policy_attachment" "ec2-bucket-read-role" {
  role       = aws_iam_role.ec2-bucket-read-role.name
  policy_arn = aws_iam_policy.ec2-bucket-read-role.arn
}

resource "aws_iam_policy" "ec2-bucket-read-role" {
  name = "ec2-bucket-read-role"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
            ],
            "Resource": "arn:aws:s3:::AccountABucketName/*"

        }
    ]
}
EOF
}
