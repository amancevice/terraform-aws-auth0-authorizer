provider aws {
  version    = "~> 1.41"
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region     = "${var.aws_region}"
  profile    = "${var.aws_profile}"
}

module authorizer {
  source                  = "amancevice/auth0-authorizer/aws"
  authorizer_audience     = "${var.authorizer_audience}"
  authorizer_jwks_uri     = "${var.authorizer_jwks_uri}"
  authorizer_token_issuer = "${var.authorizer_token_issuer}"
}

resource aws_api_gateway_rest_api api {
  description = "Example API"
  name        = "auth0"
}

resource aws_api_gateway_method any {
  authorization = "CUSTOM"
  authorizer_id = "${aws_api_gateway_authorizer.authorizer.id}"
  http_method   = "ANY"
  resource_id   = "${aws_api_gateway_rest_api.api.root_resource_id}"
  rest_api_id   = "${aws_api_gateway_rest_api.api.id}"
}

resource aws_api_gateway_integration any {
  http_method = "${aws_api_gateway_method.any.http_method}"
  resource_id = "${aws_api_gateway_rest_api.api.root_resource_id}"
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  type        = "MOCK"

  request_templates {
    "application/json" = "{\"statusCode\": 200}"
  }
}

resource aws_api_gateway_authorizer authorizer {
  authorizer_credentials = "${module.authorizer.lambda_role_arn}"
  authorizer_uri         = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${module.authorizer.lambda_arn}/invocations"
  name                   = "auth0"
  rest_api_id            = "${aws_api_gateway_rest_api.api.id}"
}
