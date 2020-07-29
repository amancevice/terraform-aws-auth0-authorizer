# AWS Auth0 Authorizer

[![terraform](https://img.shields.io/github/v/tag/amancevice/terraform-aws-auth0-authorizer?color=62f&label=version&logo=terraform&style=flat-square)](https://registry.terraform.io/modules/amancevice/serverless-pypi/aws)
[![build](https://img.shields.io/github/workflow/status/amancevice/terraform-aws-auth0-authorizer/validate?logo=github&style=flat-square)](https://github.com/amancevice/terraform-aws-auth0-authorizer/actions)

Authorizer Lambda for API Gateway custom authorizers.

## Quickstart

```terraform
module authorizer {
  source                  = "amancevice/auth0-authorizer/aws"
  authorizer_audience     = "https://<your-api-audience>/"
  authorizer_jwks_uri     = "https://<your-tenant>.auth0.com/.well-known/jwks.json"
  authorizer_token_issuer = "https://<your-tenant>.auth0.com/"
}
```

See the [`example`](./example) for a more detailed implementation.

## Resources

- CloudWatch log group for Lambda logs
- IAM Role with inline & attached Policies for Lambda
- Lambda function for validating Auth0 Bearer token
