import json
import datetime
import uuid

users = [
    {
        "userId": 1,
        "username": "matt",
        "password": "pass123",
        "firstName": "Matt",
        "lastName": "Todd"
    },
    {
        "userId": 2,
        "username": "abbi",
        "password": "pass123",
        "firstName": "Abigail",
        "lastName": "Todd"
    },
    {
        "userId": 3,
        "username": "caleb",
        "password": "pass123",
        "firstName": "Caleb",
        "lastName": "Todd"
    }
]

def _expiration_time():
    return datetime.datetime.now() + datetime.timedelta(minutes=5)

def lambda_handler(event, context):
    username = event["username"]
    password = event["password"]

    try:
        user = (u for u in users if u["username"] == username and u["password"] == password).next()
    except Exception:
        user = None

    if user == None:
        return {
            "statusCode": 400,
            "headers": { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" },
            "body": json.dumps({})
        }
    else:
        auth_token = str(uuid.uuid1())
        data = {
            "authToken": auth_token,
            "userId": user["userId"],
            "firstName": user["firstName"],
            "lastName": user["firstName"],
            "expiresAt": str(_expiration_time()),
        }
        
        return {
            'statusCode': 200,
            'headers': { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" },
            'body': json.dumps(data)
        }

