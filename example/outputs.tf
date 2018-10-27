output authorizer_lambda_arn {
  description = "API Lambda ARN."
  value       = "${module.authorizer.lambda_arn}"
}

output authorizer_lambda_name {
  description = "API Lambda name."
  value       = "${module.authorizer.lambda_name}"
}

output authorizer_lambda_role_arn {
  description = "Lambda role ARN."
  value       = "${module.authorizer.lambda_role_arn}"
}

output authorizer_lambda_role_name {
  description = "Lambda role name."
  value       = "${module.authorizer.lambda_role_name}"
}

output authorizer_lambda_role_policy_arns {
  description = "Lambda role policy ARNs."
  value       = ["${module.authorizer.lambda_role_policy_arns}"]
}
