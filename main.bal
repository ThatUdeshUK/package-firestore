import ballerina/io;
import ballerina/http;
import udesh/firestore;

endpoint firestore:Client clientEndpoint {
    projectId: "huk-app",
    apiKey: "AIzaSyDiRPNKmVUizFlwgAFYcMZjETW2fYPdmTo"
};

documentation {
   Prints `Hello World`.
}
function main(string... args) {
    var ref = clientEndpoint->ref();
    var resp = ref.collection("user").document("0cYRbpIAbUf59AvVY63629fofv03").get();
    match resp {
        json res => {
            io:println(res);
        }
        firestore:FirestoreError err => {
            io:println(err.message);
        }
    }
}