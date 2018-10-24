output lambda_arn {
  description = "API Lambda ARN."
  value       = "${aws_lambda_function.lambda.arn}"
}

output lambda_name {
  description = "API Lambda name."
  value       = "${aws_lambda_function.lambda.function_name}"
}

output lambda_role_arn {
  description = "Lambda role ARN."
  value       = "${aws_iam_role.lambda_role.arn}"
}

output lambda_role_name {
  description = "Lambda role name."
  value       = "${aws_iam_role.lambda_role.name}"
}

output invoke_role_arn {
  description = "Lambda role ARN."
  value       = "${aws_iam_role.invoke_role.arn}"
}

output invoke_role_name {
  description = "Lambda role name."
  value       = "${aws_iam_role.invoke_role.name}"
}
