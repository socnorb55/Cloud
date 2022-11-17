data "aws_caller_identity" "current" {}
data "aws_region" "current_region" {}

resource "aws_lambda_function" "test_lambda" {
    filename ="${path.module}../src.zip"
    function_name ="test_lambda-${var.env}"
    role ="arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/lambda_role"
    handler ="src.hello_world.lambda_handler"
    source_code_hash = filebase64sha256("${path.module}/../src.zip")
    layers =[aws_lambda_layer_version.python_packages_layer.arn]
}

resource "aws_lambda_layer_version" "python_packages_layer" {
    layer_name ="lambda_layer_${var.env}"
    filename ="lambda_layers.zip"
    source_code_hash = filebase64sha256("lambda_layers.zip")
}