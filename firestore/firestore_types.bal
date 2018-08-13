import ballerina/http;

documentation {
    F{{name}} The resource name of the document
    F{{fields}} The document's fields.
    F{{createTime}} The time at which the document was created.
    F{{updateTime}} The time at which the document was last changed.
}
public type Document record {
    string name;
    json fields;
    string createTime;
    string updateTime;
};

documentation {
    F{{message}} A custom message about the error
    F{{cause}} Error object reffered to the occurred error
}
public type FirestoreError record {
    string message;
    error? cause;
};
