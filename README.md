![No longer maintained](https://img.shields.io/badge/Maintenance-OFF-red.svg)

### ⚠️ Deprecated

This repository is no longer actively maintained and has been archived by the [Security team](https://teams.microsoft.com/l/channel/19%3A38b4a7fa05ac4ec782143b767304c53c%40thread.skype/General?groupId=99480e15-059f-4bea-b7cc-4912903bd6f6&tenantId=30459df5-1e53-4d8b-a162-0ad2348546f1).
The repository is retained for historical and reference purposes and is read-only while archived.
If this repository is required in the future, it can be unarchived. Please raise a request with the [CodX team](https://teams.microsoft.com/l/channel/19%3Aa654db0c76f84164aebe0cccf297e6de%40thread.skype/CoDX%20Support?groupId=602f2603-465a-49fa-be9e-abfe0b05b551&tenantId=30459df5-1e53-4d8b-a162-0ad2348546f1) to have it unarchived.

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
