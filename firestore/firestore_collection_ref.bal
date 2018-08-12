documentation {
    Object to reference a collection in a document.

    F{{apiKey}} API key to authorization
    F{{client}} Http client endpoint for api
    F{{path}} Path to the collection
}
public type FirestoreCollectionRef object {

    string apiKey;
    http:Client client;
    string path;

    new(apiKey, client, path) {}
    
    documentation {
        Create a document in the collection and returns it.

        P{{fields}} Document in the collection
        R{{}} If success, returns json with document snapshot, else returns `FirestoreError` object
    }
    public function createDocument(json fields) returns json|FirestoreError;

    documentation {
        Returns specified document's reference of the collection.

        P{{document}} Document in the collection
        R{{}} Returns FirestoreDocumentRef with specified document's reference
    }
    public function document(string document) returns FirestoreDocumentRef;

};

function FirestoreCollectionRef::document(string document) returns FirestoreDocumentRef{
    FirestoreDocumentRef documentRef = new (self.apiKey, self.client, self.path + "/" + document);
    return documentRef; 
}

function FirestoreCollectionRef::createDocument(json fields) returns json|FirestoreError {
    endpoint http:Client httpClient = self.client;
    json document = { fields: fields };
    var resp = httpClient->post(FIRESTORE_DOCUMENTS + self.path + "?key=" + self.apiKey, document);
    var jsonResponse = check parseResponseToJson(resp);
    return jsonResponse; 
}
