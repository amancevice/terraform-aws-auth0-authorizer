variable authorizer_audience {
  description = "Token audience (eg, Auth0 API identifier)."
}

variable authorizer_jwks_uri {
  description = "JWKS endpoint (eg, https://your-tenant.auth0.com/.well-known/jwks.json)."
}

variable authorizer_token_issuer {
  description = "Token issuer (eg, https://your-tenant.auth0.com/)."
}

variable aws_access_key_id {
  description = "AWS access key ID."
  default     = ""
}

variable aws_profile {
  description = "AWS profile."
  default     = ""
}

variable aws_region {
  description = "AWS region."
  default     = "us-east-1"
}

variable aws_secret_access_key {
  description = "AWS secret access key."
  default     = ""
}
