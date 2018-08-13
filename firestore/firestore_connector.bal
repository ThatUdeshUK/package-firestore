documentation {
    Object to initialize the connection with Firestore.

    F{{apiKey}} API key to authorization
    F{{client}} Http client endpoint for api
}
public type FirestoreConnector object {
    
    public string apiKey;
    public http:Client client;

    documentation {
        Returns snapshot of the document of the specified path.
        
        P{{path}} Path to the document
        R{{}} If success, returns Document with document snapshot, else returns `FirestoreError` object
    }
    public function get(string path) returns Document|FirestoreError;

    documentation {
        Returns reference the default database
        
        R{{}} Returns FirestoreRef with default database'ss reference
    }
    public function ref() returns FirestoreRef;

};

function FirestoreConnector::get(string path) returns Document|FirestoreError {
    endpoint http:Client httpClient = self.client;
    var resp = httpClient->get(FIRESTORE_DOCUMENTS + path + "?key=" + self.apiKey);
    var doc = check parseResponseToDocument(resp);
    return doc; 
}

function FirestoreConnector::ref() returns FirestoreRef {
    FirestoreRef ref = new (self.apiKey, self.client);
    return ref; 
}