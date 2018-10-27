# AWS Auth0 Authorizer

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
