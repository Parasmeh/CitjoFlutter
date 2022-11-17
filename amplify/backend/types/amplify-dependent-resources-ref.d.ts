export type AmplifyDependentResourcesAttributes = {
    "auth": {
        "citjoauth": {
            "IdentityPoolId": "string",
            "IdentityPoolName": "string",
            "HostedUIDomain": "string",
            "OAuthMetadata": "string",
            "UserPoolId": "string",
            "UserPoolArn": "string",
            "UserPoolName": "string",
            "AppClientIDWeb": "string",
            "AppClientID": "string"
        }
    },
    "storage": {
        "citjo": {
            "BucketName": "string",
            "Region": "string"
        }
    },
    "api": {
        "citjo": {
            "GraphQLAPIKeyOutput": "string",
            "GraphQLAPIIdOutput": "string",
            "GraphQLAPIEndpointOutput": "string"
        }
    }
}