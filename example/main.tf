provider aws {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region     = "${var.aws_region}"
  profile    = "${var.aws_profile}"
  version    = "~> 1.41"
}

module authorizer {
  source                  = "amancevice/auth0-authorizer/aws"
  authorizer_audience     = "${var.authorizer_audience}"
  authorizer_jwks_uri     = "${var.authorizer_jwks_uri}"
  authorizer_token_issuer = "${var.authorizer_token_issuer}"
}
