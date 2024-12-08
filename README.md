# AWS Amplify Next.js (App Router) Minimal Template

This repository provides a starter template for creating applications using Next.js (App Router) and AWS Amplify, 
avoiding AppSync at all costs and using Amplify only for server-side rendering while avoiding proprietary bindings.


## Deploying to AWS

To set up remote infrastructure, switch to the `/terraform` directory and run:

1. `AWS_PROFILE=yourprofile terraform init -upgrade`
1. `AWS_PROFILE=yourprofile terraform apply`


## License

This library is licensed under the MIT-0 License. See the LICENSE file.