variable authorizer_audience {
  description = "Token audience (eg, Auth0 API identifier)."
}

variable authorizer_jwks_uri {
  description = "JWKS endpoint (eg, https://your-tenant.auth0.com/.well-known/jwks.json)."
}

variable authorizer_token_issuer {
  description = "Token issuer (eg, https://your-tenant.auth0.com/)."
}

variable cloudwatch_log_group_retention_in_days {
  description = "Days to retain logs in CloudWatch."
  default     = 30
}

variable invoke_role_name {
  description = "Lambda invocation role."
  default     = "auth0-authorizer-invoke"
}

variable invoke_role_path {
  description = "Lambda invocation role path."
  default     = "/"
}

variable lambda_function_name {
  description = "Lambda function name."
  default     = "auth0-authorizer"
}

variable lambda_memory_size {
  description = "Lambda memory."
  default     = 128
}

variable lambda_role_name {
  description = "Lambda role name."
  default     = "auth0-authorizer"
}

variable lambda_role_path {
  description = "Lambda role path."
  default     = "/"
}

variable lambda_role_policy_arns {
  description = "Lambda role policy attachment ARNs."
  type        = "list"
  default     = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

variable lambda_tags {
  description = "Lambda tags."
  type        = "map"
  default     = {}
}

variable lambda_timeout {
  description = "Lambda timeout."
  default     = 3
}
