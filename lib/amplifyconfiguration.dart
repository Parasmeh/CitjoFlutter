const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "citjo": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://3defmtreujccxpt46zavqo73dm.appsync-api.ap-south-1.amazonaws.com/graphql",
                    "region": "ap-south-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-wwy7be6yprhvfpqlwoiqxjicum"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-south-1:aef6a64a-e0f7-4f16-a7bf-9b46be1d24f2",
                            "Region": "ap-south-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-south-1_x9LKUOsoA",
                        "AppClientId": "a085qjt7kpv5p6sdndpm21jk6",
                        "Region": "ap-south-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "citjo-auth-dev.auth.ap-south-1.amazoncognito.com",
                            "AppClientId": "a085qjt7kpv5p6sdndpm21jk6",
                            "SignInRedirectURI": "myapp://",
                            "SignOutRedirectURI": "myapp://",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [
                            "GOOGLE"
                        ],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "citjos3232119-dev",
                        "Region": "ap-south-1"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://3defmtreujccxpt46zavqo73dm.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-wwy7be6yprhvfpqlwoiqxjicum",
                        "ClientDatabasePrefix": "citjo_API_KEY"
                    },
                    "citjo_AWS_IAM": {
                        "ApiUrl": "https://3defmtreujccxpt46zavqo73dm.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "citjo_AWS_IAM"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "citjos3232119-dev",
                "region": "ap-south-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';