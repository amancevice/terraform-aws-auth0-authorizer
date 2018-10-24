data aws_iam_policy_document lambda_role {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

data aws_iam_policy_document invoke_role {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["apigateway.amazonaws.com"]
      type        = "Service"
    }
  }
}

data aws_iam_policy_document invoke {
  statement {
    actions   = ["lambda:InvokeFunction"]
    resources = ["${aws_lambda_function.lambda.arn}"]
  }
}

resource aws_cloudwatch_log_group logs {
  name              = "/aws/lambda/${aws_lambda_function.lambda.function_name}"
  retention_in_days = "${var.cloudwatch_log_group_retention_in_days}"
}

resource aws_lambda_function lambda {
  description      = "Auth0 authorizer"
  filename         = "${path.module}/package.zip"
  function_name    = "${var.lambda_function_name}"
  handler          = "index.handler"
  memory_size      = "${var.lambda_memory_size}"
  role             = "${aws_iam_role.lambda_role.arn}"
  runtime          = "nodejs8.10"
  source_code_hash = "${base64sha256(file("${path.module}/package.zip"))}"
  tags             = "${var.lambda_tags}"
  timeout          = "${var.lambda_timeout}"

  environment {
    variables {
      JWKS_URI     = "${var.authorizer_jwks_uri}"
      AUDIENCE     = "${var.authorizer_audience}"
      TOKEN_ISSUER = "${var.authorizer_token_issuer}"
    }
  }
}

resource aws_iam_role lambda_role {
  assume_role_policy = "${data.aws_iam_policy_document.lambda_role.json}"
  description        = "Auth0 authorizer resource access"
  name               = "${var.lambda_role_name}"
  path               = "${var.lambda_role_path}"
}

resource aws_iam_role invoke_role {
  assume_role_policy = "${data.aws_iam_policy_document.invoke_role.json}"
  description        = "Auth0 authorizer invocation access"
  name               = "${var.invoke_role_name}"
  path               = "${var.invoke_role_path}"
}

resource aws_iam_policy invoke {
  description = "Permission to invoke authorization Lambda."
  name        = "${var.invoke_role_name}"
  policy      = "${data.aws_iam_policy_document.invoke.json}"
}

resource aws_iam_role_policy_attachment invoke_policy {
  policy_arn = "${aws_iam_policy.invoke.arn}"
  role       = "${aws_iam_role.invoke_role.name}"
}


resource aws_iam_role_policy_attachment lambda_policies {
  count      = "${length(var.lambda_role_policy_arns)}"
  policy_arn = "${element(var.lambda_role_policy_arns, count.index)}"
  role       = "${aws_iam_role.lambda_role.name}"
}
