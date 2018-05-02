# lambda-serverless-template

Serverless framework template for a Lambda-based service

## Getting started

Make sure you have the [Serverless framework](https://serverless.com/framework/) installed on your machine. You'll only need it for the purpose of installing the template, as the template would have install it as a dev dependencies to mitigate the issues of incompatibility when the framework updates.

1. Run `serverless install --url https://github.com/getndazn/lambda-serverless-template --name <insert_name_of_your_service_here>`

2. Run `nmp install`

## Project structure

`build.sh`  : simple bash script that allows you to test and deploy your code easily, e.g. `./build.sh test` to run test, `./build.sh deploy dev` to deploy to `dev` environment, or `./build.sh all dev` to run test and then deploy to `dev` environment (if tests pass)

`functions` : put all the handler modules there

`examples`  : put all the captured invocation events as JSON there (for local debugging)

`Dockerfile` : docker file to be triggered by Jenkins build config that will run `./build.sh all dev` (more work to be done here to allow environment to be passed in)

## Plugins included

`serverless-pseudo-parameters` : allows you to use `#{AWS::Region}` and `#{AWS::AccountId}` to reference the AWS region and account ID you're deploying into. It's useful because you often need to pass fully qualified ARN (in IAM permissions, env variables, etc.). See the plugin [repo](https://github.com/svdgraaf/serverless-pseudo-parameters) for more details.

`serverless-iam-roles-per-function` : allows you to specify per function IAM roles. This is important as it reduces the attack surface should a function become compromised. See the plugin [repo](https://github.com/functionalone/serverless-iam-roles-per-function) for more details.

## Other plugins to consider

Here are some other plugins to consider:

`serverless-domain-manager` : allows you to create and manage custom domain names in `API Gateway` and `Route53`

`serverless-step-functions` : allows you to create `Step Functions` state machines

`serverless-dynamodb-autoscaling` : allows you to configure auto-scaling for `DynamoDB` tables

Also consider installing `middy` which is a nice middleware engine that makes it easy to address common cross-cutting concerns such as input validation, error handling, etc.

## Checklist before you deploy

1. Run `npm install serverless --save-dev` to update to the latest version of the [Serverless framework](https://serverless.com/framework/) as a **DEV dependency**

2. Delete the `hello-world` function from the `functions` folder, and remove it from the `serverless.yml`