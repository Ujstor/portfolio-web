data "archive_file" "lambda" {

  type             = var.lambda_config.archive_type
  source_file      = "${var.lambda_config.work_dir}/${var.lambda_config.bin_name}"
  output_path      = "${var.lambda_config.work_dir}/${var.lambda_config.archive_bin_name}"
  output_file_mode = "0666"

}

data "aws_iam_policy_document" "assume_role_lambda" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json

  inline_policy {}
}

resource "aws_lambda_function" "lambda" {

  filename         = "${var.lambda_config.work_dir}/${var.lambda_config.archive_bin_name}"
  function_name    = var.lambda_config.function_name
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = var.lambda_config.handler
  runtime          = var.lambda_config.runtime
  source_code_hash = data.archive_file.lambda.output_base64sha256

  ephemeral_storage {
    size = var.lambda_config.ephemeral_storage
  }

  depends_on = [data.archive_file.lambda]
}
