resource "aws_amplify_app" "amplify-test" {
  name       = "amplify-test"
  repository = "https://github.com/deckerego/amplify-test"

  build_spec = <<-EOT
    version: 1
    backend:
    phases:
        build:
        commands:
            - npm ci --cache .npm --prefer-offline
            - npx ampx pipeline-deploy --branch $AWS_BRANCH --app-id $AWS_APP_ID
    frontend:
    phases:
        build:
        commands:
            - npm run build
    artifacts:
        baseDirectory: .next
        files:
        - '**/*'
    cache:
        paths:
        - .next/cache/**/*
        - .npm/**/*
        - node_modules/**/*
  EOT

  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    STAGE = "${terraform.workspace}"
  }
}
