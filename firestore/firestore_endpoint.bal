documentation {
    Object for Firestore endpoint.

    F{{firestoreConnector}} Reference to FirestoreConnector type
}
public type Client object {
    
    public FirestoreConnector firestoreConnector = new;

    documentation {
        Initialize Firestore endpoint.

        P{{firestoreConfig}} Firestore configuraion
    }
    public function init(FirestoreConfig firestoreConfig);

    documentation {
        Initialize Firestore endpoint.

        R{{}} The FirestoreConnector object
    }
    public function getCallerActions() returns FirestoreConnector;

};

documentation {
    Configurations for the Firestore client

    F{{projectId}} Id of the Firebase project
    F{{apiKey}} API key to authorization
}
public type FirestoreConfig record {
    string projectId;
    string apiKey;
};

function Client::init(FirestoreConfig firestoreConfig) {
    self.firestoreConnector.apiKey = firestoreConfig.apiKey;
    http:ClientEndpointConfig clientConfig;
    clientConfig.url = FIRESTORE_API + firestoreConfig.projectId;
    self.firestoreConnector.client.init(clientConfig);
}

function Client::getCallerActions() returns FirestoreConnector {
    return self.firestoreConnector;
}
