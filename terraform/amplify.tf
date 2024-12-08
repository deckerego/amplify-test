resource "aws_amplify_app" "amplifytest" {
  name = "amplifytest"
  # The repository is intentionally omitted - set up authentication manually
  # using the "Add Branch" functionality within the Amplify console.
  # This is the best way to set up OAuth into GitHub or whatevs.

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

  tags = {
    STAGE = "${terraform.workspace}"
  }
}
