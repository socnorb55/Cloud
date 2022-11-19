data "aws_caller_identity" "current" {}
data "aws_region" "current_region" {}

resource "aws_lambda_function" "test_lambda" {
    filename = data.archive_file.src.output_path
    function_name ="test_lambda-${var.env}"
    role ="arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/lambda_role"
    handler ="src.hello_world.lambda_handler"
    runtime = "python3.9"
}