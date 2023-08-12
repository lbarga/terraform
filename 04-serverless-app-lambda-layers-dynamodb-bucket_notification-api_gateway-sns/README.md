# STEPS

- create cognito
- create dynamoDB
- create iam
- create lambda s3
- create lambda layer "joi dependencie"
- create lambda dynamo
- create s3 bucket notification
- create api gateway integration
- create insomnia to test restful
- create s3.json to test s3 upload by file

# OUTPUTS

- `api_url`: "https://kz092ww15f.execute-api.us-east-1.amazonaws.com/dev"
- `bucket_name`: "api-todo-balanced-yeti"
- `cognito_client_id`: "1devbu8lnm28gtn9avjd400fs5"
- `cognito_pool_id`: "us-east-1_N0Bui8LO7"
- `cognito_url`: "https://api-todo.auth.us-east-1.amazoncognito.com"
- `lambda_dynamo_url`: "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:215785215210:function:dynamo/invocations"
- `lambda_layer_description`: "joi: 17.3.0"
- `lambda_layer_name`: "joi-layer"
- `lambda_layer_version`: "1"
- `lambda_s3_url`: "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:215785215210:function:s3/invocations"
