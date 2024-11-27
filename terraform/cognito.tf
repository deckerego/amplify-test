resource "aws_cognito_user_pool" "amplifytest" {
  name = "AmplifyTest.UserPool"
  username_attributes = [ "email" ]
  auto_verified_attributes = [ "email" ]

  admin_create_user_config {
    allow_admin_create_user_only = true
    invite_message_template {
      email_subject = "Your Amplify Test Temporary Password"
      email_message = "You have been invited to the Amplify Test. Your new username is {username} and your temporary password is {####} - make sure you log in and verify you new account as soon as you can at ${var.amplifytest_login_url}."
      sms_message = "Welcome! Your Amplify Test username is {username} & temp password is {####}"
    }
  }

  username_configuration {
    case_sensitive = false
  }

  password_policy {
    minimum_length = 8
    require_lowercase = true
    require_numbers = true
    require_symbols = false
    require_uppercase = true
    temporary_password_validity_days = 7
  }

  schema {
    name = "name"
    attribute_data_type = "String"
    mutable = true
    required = false
    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }

  schema {
    name = "email"
    attribute_data_type = "String"
    mutable = true
    required = true
    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }

  email_configuration {
    email_sending_account = "DEVELOPER"
    source_arn = "${var.amplifytest-ses-identity}"
    from_email_address = "${var.amplifytest-ses-from}"
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_LINK"
    email_subject_by_link = "Your Amplify Test Email Verification Link"
    email_message_by_link = "Welcome to the Amplify Test. To verify your email address, please click the following link: {##Verify Email##}"
  }

  account_recovery_setting {
    recovery_mechanism {
      name = "verified_email"
      priority = 1
    }
  }
}

resource "aws_cognito_user_pool_domain" "amplifytest" {
  domain       = "amplifytest"
  user_pool_id = aws_cognito_user_pool.amplifytest.id
}

resource "aws_cognito_user_pool_ui_customization" "amplifytest" {
  css        = file("cognito.css")
  image_file = filebase64("cognito.png")
  user_pool_id = aws_cognito_user_pool_domain.amplifytest.user_pool_id
}
