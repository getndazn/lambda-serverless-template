# lambda-serverless-template

Serverless framework template for a Lambda-based service

## Getting started

1. Run `npx serverless install --url https://github.com/getndazn/lambda-serverless-template --name <insert_name_of_your_service_here>`

2. Run `npm install` in the root of your newly created service directory.

## Project structure

`src/functions` : put all the handler modules there

`examples`  : put all the captured invocation events as JSON there (for local debugging)

## Plugins included

`serverless-pseudo-parameters` : allows you to use `#{AWS::Region}` and `#{AWS::AccountId}` to reference the AWS region and account ID you're deploying into. It's useful because you often need to pass fully qualified ARN (in IAM permissions, env variables, etc.). See the plugin [repo](https://github.com/svdgraaf/serverless-pseudo-parameters) for more details.

`serverless-iam-roles-per-function` : allows you to specify per function IAM roles. This is important as it reduces the attack surface should a function become compromised. See the plugin [repo](https://github.com/functionalone/serverless-iam-roles-per-function) for more details.

`@perform/serverless-dazn-cloudwatch-logs` : changes CloudWatch LogGroup naming to follow [DAZN Centralized Application Logging](https://livesport.atlassian.net/wiki/spaces/DP/pages/807862308/Centralised+Application+Logging) convention.

## Other plugins to consider

Here are some other plugins to consider:

`serverless-domain-manager` : allows you to create and manage custom domain names in `API Gateway` and `Route53`

`serverless-step-functions` : allows you to create `Step Functions` state machines

`serverless-dynamodb-autoscaling` : allows you to configure auto-scaling for `DynamoDB` tables

Also consider installing `middy` which is a nice middleware engine that makes it easy to address common cross-cutting concerns such as input validation, error handling, etc.

## Checklist before you deploy

1. Run `npm install serverless --save-dev` to update to the latest version of the [Serverless framework](https://serverless.com/framework/) as a **DEV dependency**

2. Run `npm outdated` to check if any outdated packages should be updated.

2. Delete the `hello-world` function from the `functions` folder, and remove it from the `serverless.yml`
