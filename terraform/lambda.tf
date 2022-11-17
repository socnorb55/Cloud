data "aws_caller_identity" "current" {}
data "aws_region" "current_region" {}

resource "aws_lambda_function" "test_lambda" {
    filename ="${path.module}../src.zip"
    function_name ="test_lambda-${var.env}"
    role ="arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/lambda_role"
    handler ="src.hello_world.lambda_handler"
    layers =[aws_lambda_layer_version.python_packages_layer.arn]
    runtime = "python3.x"
}

resource "aws_lambda_layer_version" "python_packages_layer" {
    layer_name ="lambda_layer_${var.env}"
    filename ="lambda_layers.zip"
}