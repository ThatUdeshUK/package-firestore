import ballerina/http;
import ballerina/io;

documentation {
    Check for HTTP response and if response is success parse HTTP response object into Document and parse error otherwise.

    P{{response}} Http response or HTTP connector error with network related errors
    R{{}} Document or `FirebaseError` if anything wrong happen when HTTP client invocation or parsing response to json
}
function parseResponseToDocument(http:Response|error response) returns (Document|FirestoreError) {
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
                    Document doc = {
                        name: (<string> payload["name"]) but { error err => UNDEFINED },
                        fields: payload["fields"],
                        createTime: (<string> payload["createTime"]) but { error err => UNDEFINED },
                        updateTime: (<string> payload["updateTime"]) but { error err => UNDEFINED }
                    };
                    return doc;
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

documentation {
    Check for HTTP response and if response is success parse HTTP response object into null and parse error otherwise.

    P{{response}} Http response or HTTP connector error with network related errors
    R{{}} null or `FirebaseError` if anything wrong happen when HTTP client invocation or parsing response to json
}
function parseResponseToNullOrError(http:Response|error response) returns ()|FirestoreError {
    match response {
        http:Response httpResponse => {
            if (httpResponse.statusCode != http:OK_200 && httpResponse.statusCode != http:CREATED_201) {
                FirestoreError firestoreError = { message: httpResponse.statusCode + " "
                    + httpResponse.reasonPhrase };
                return firestoreError;
            }
            return ();
        }
        error err => {
            FirestoreError firestoreError = { message: err.message };
            firestoreError.cause = err.cause;
            return firestoreError;
        }
    }
}

