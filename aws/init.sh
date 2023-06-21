#!/bin/bash

## topics
awslocal sns create-topic --name NOTIFIER_SEND_EMAIL
awslocal sns create-topic --name ACCOUNTANCY-USER-PORTFOLIO_USER_CREATED
awslocal sns create-topic --name ACCOUNTANCY-USER-PORTFOLIO_USER_UPDATED
awslocal sns create-topic --name ACCOUNTANCY-USER-PORTFOLIO_CUSTOMER_PORTFOLIO_CREATED
awslocal sns create-topic --name ACCOUNTANCY-USER-PORTFOLIO_CUSTOMER_PORTFOLIO_UPDATED
awslocal sns create-topic --name ACCOUNTANCY-ACCOUNT_ACCOUNT_CREATED

## queues
awslocal sqs create-queue --queue-name ACCOUNTANCY-ACCOUNT_ACCOUNT_CREATED_ACCOUNTANCY-USER-PORTFOLIO
awslocal sqs create-queue --queue-name ACCOUNTANCY-ACCOUNT_ACCOUNT_CREATED_ACCOUNTANCY-USER-PORTFOLIO_DLQ

awslocal sqs create-queue --queue-name ACCOUNTANCY-USER-PORTFOLIO_USER_CREATED_ACCOUNTANCY-ACCOUNT
awslocal sqs create-queue --queue-name ACCOUNTANCY-USER-PORTFOLIO_USER_CREATED_ACCOUNTANCY-ACCOUNT_DLQ

awslocal sqs create-queue --queue-name ACCOUNTANCY_RELATION_CREATED_ACCOUNTANCY-USER-PORTFOLIO
awslocal sqs create-queue --queue-name ACCOUNTANCY_RELATION_CREATED_ACCOUNTANCY-USER-PORTFOLIO_DLQ

awslocal sqs create-queue --queue-name ACCOUNTANCY_RELATION_UPDATED_ACCOUNTANCY-USER-PORTFOLIO
awslocal sqs create-queue --queue-name ACCOUNTANCY_RELATION_UPDATED_ACCOUNTANCY-USER-PORTFOLIO_DLQ

awslocal sqs create-queue --queue-name CONTAAZUL_COMPANY_UPDATED_ACCOUNTANCY-USER-PORTFOLIO
awslocal sqs create-queue --queue-name CONTAAZUL_COMPANY_UPDATED_ACCOUNTANCY-USER-PORTFOLIO_DLQ

## subscriptions
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:ACCOUNTANCY-ACCOUNT_ACCOUNT_CREATED \
         --protocol sqs \
         --notification-endpoint arn:aws:sqs:us-east-1:queue:ACCOUNTANCY-ACCOUNT_ACCOUNT_CREATED_ACCOUNTANCY-USER-PORTFOLIO
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:ACCOUNTANCY-USER-PORTFOLIO_USER_CREATED \
         --protocol sqs \
         --notification-endpoint arn:aws:sqs:us-east-1:queue:ACCOUNTANCY-USER-PORTFOLIO_USER_CREATED_ACCOUNTANCY-ACCOUNT

## buckets
awslocal s3api create-bucket --bucket localstack-bucket --acl public-read

echo "finalized localstack config".
