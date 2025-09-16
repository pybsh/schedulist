const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "schedulist": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://5pilv7co4rgqnmv2omglyyfqjq.appsync-api.ap-northeast-2.amazonaws.com/graphql",
                    "region": "ap-northeast-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-ixp6y2hvk5b7pdhert7jcolory"
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
                            "PoolId": "ap-northeast-2:c9d570f3-7571-4a57-be77-7c0a026afb66",
                            "Region": "ap-northeast-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-northeast-2_iqNDy44q9",
                        "AppClientId": "6aoe669o67eklbtpvg4ik3b1fi",
                        "Region": "ap-northeast-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "schedulist678ce1da-678ce1da-dev.auth.ap-northeast-2.amazoncognito.com",
                            "AppClientId": "6aoe669o67eklbtpvg4ik3b1fi",
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
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://5pilv7co4rgqnmv2omglyyfqjq.appsync-api.ap-northeast-2.amazonaws.com/graphql",
                        "Region": "ap-northeast-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-ixp6y2hvk5b7pdhert7jcolory",
                        "ClientDatabasePrefix": "schedulist_API_KEY"
                    }
                }
            }
        }
    }
}''';
