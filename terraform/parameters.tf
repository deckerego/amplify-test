variable "domain" {
  default = "example.net"
}

variable "amplifytest-ses-from" {
  default = "aws.test@${var.domain}"
}

variable "volunteer_login_url" {
  default = "https://"${var.domain}"
}

resource "aws_ssm_parameter" "providerUrl" {
  name = "/auth/userpool-amplifytest/providerUrl"
  description = "Cognito user pool provider URL"
  type = "SecureString"
  value = "https://cognito-idp.${data.aws_region.current.name}.amazonaws.com/${aws_cognito_user_pool.amplifytest.id}"
}

resource "aws_ssm_parameter" "userPoolId" {
  name = "/auth/userpool-amplifytest/userPoolId"
  description = "Cognito user pool identifier"
  type = "SecureString"
  value = "${aws_cognito_user_pool.amplifytest.id}"
}

variable "amplifytest-ses-identity" {
  default = "arn:aws:ses:us-east-1:${data.aws_caller_identity.current.account_id}:identity/${var.amplifytest-ses-from}"
}
