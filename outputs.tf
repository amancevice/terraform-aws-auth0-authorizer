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
  value       = "${aws_iam_role.role.arn}"
}

output lambda_role_name {
  description = "Lambda role name."
  value       = "${aws_iam_role.role.name}"
}

output lambda_role_policy_arns {
  description = "Lambda role policy ARNs."
  value       = ["${aws_iam_role_policy_attachment.lambda_policies.*.policy_arn}"]
}
