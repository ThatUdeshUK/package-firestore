import ballerina/http;

documentation {
    Check for HTTP response and if response is success parse HTTP response object into json and parse error otherwise.

    P{{response}} Http response or HTTP connector error with network related errors
    R{{}} Json payload or `FirebaseError` if anything wrong happen when HTTP client invocation or parsing response to json
}
function parseResponseToJson(http:Response|error response) returns (json|FirestoreError) {
    json result = {};
    match response {
        http:Response httpResponse => {
            var jsonPayload = httpResponse.getJsonPayload();
            match jsonPayload {
                json payload => {
                    if (httpResponse.statusCode != http:OK_200 && httpResponse.statusCode != http:CREATED_201) {
                        FirestoreError firestoreError = { message: httpResponse.statusCode + " "
                            + httpResponse.reasonPhrase + " - " + payload.toString() };
                        return firestoreError;
                    }
                    return payload;
                }
                error err => {
                    FirestoreError firestoreError = { message: "Error occurred when parsing response to json." };
                    firestoreError.cause = err.cause;
                    return firestoreError;
                }
            }
        }
        error err => {
            FirestoreError firestoreError = { message: err.message };
            firestoreError.cause = err.cause;
            return firestoreError;
        }
    }
}
