resource "aws_s3_bucket" "s3Bucket" {
     bucket = "test-bucket-11-11-22"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::test-bucket-11-11-22/*",
         "principal" : "*"
      }
    ]
  }
