output lambda_arn {
  description = "API Lambda ARN."
  value       = "${module.authorizer.lambda_arn}"
}

output lambda_name {
  description = "API Lambda name."
  value       = "${module.authorizer.lambda_name}"
}

output role_arn {
  description = "Lambda role ARN."
  value       = "${module.authorizer.lambda_role_arn}"
}

output role_name {
  description = "Lambda role name."
  value       = "${module.authorizer.lambda_role_name}"
}
