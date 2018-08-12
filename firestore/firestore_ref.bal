documentation {
    Object to reference the default database.

    F{{apiKey}} API key to authorization
    F{{client}} Http client endpoint for api
}
public type FirestoreRef object {
    
    string apiKey;
    http:Client client;

    new(apiKey, client) {}

    documentation {
        Returns specified collection's reference from the database.

        P{{collection}} Collection in the database 
        R{{}} Returns FirestoreCollectionRef with specified collection's reference
    }
    public function collection(string collection) returns FirestoreCollectionRef;

};

function FirestoreRef::collection(string collection) returns FirestoreCollectionRef {
    FirestoreCollectionRef collectionRef = new (self.apiKey, self.client, collection);
    return collectionRef; 
}
