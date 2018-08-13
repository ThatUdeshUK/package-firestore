Connects to Firestore from Ballerina. 

# Package Overview
The Firestore connector allows you to create, delete and retrive document firestore through the Firebase REST API.

## Compatibility
|                    |    Version     |  
|:------------------:|:--------------:|
| Ballerina Language |   0.981.0      |
| Firestore API      |   v1 Beta1     |

## Sample

Import the `udeshuk/firestore` package into the Ballerina project.

```ballerina
import udeshuk/firestore;
```
    
The Firestore connector has be instantiated using the Firebase project id and API key in the Firestore client config.

**Obtaining project id and API Key**

1. Sign in to https://console.firebase.google.com/.
2. Click **Add Project** and necessary information about the project.
3. Agree to the terms and click **Create Project**.
4. After creating the project, click **Add Firebase to your web app**.
5. In the dialog you can find the **apiKey** and **projectId**.
6. Go to Database tab in the Develop section and click **Create Database**.
6. Select **Start in test mode** and enable.


You can now enter the projectId and apiKey in the Firestore client config:
```ballerina
endpoint firestore:Client firestoreClient {
    projectId: "<Your project id>",
    apiKey: "<Your API key>"
};
```