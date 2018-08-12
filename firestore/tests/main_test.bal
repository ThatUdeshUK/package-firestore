import ballerina/test;
import ballerina/io;

documentation {
   Before Suite Function
}
@test:BeforeSuite
function beforeSuiteFunc () {
    io:println("I'm the before suite function!");
}

documentation {
   Before test function
}
function beforeFunc () {
    io:println("I'm the before function!");
}

documentation {
   Test function
}
@test:Config{
    before:"beforeFunc",
    after:"afterFunc"
}
function testFunction () {
    io:println("I'm in test function!");
    test:assertTrue(true , msg = "Failed!");
}

documentation {
   After test function
}
function afterFunc () {
    io:println("I'm the after function!");
}

documentation {
   After Suite Function
}
@test:AfterSuite
function afterSuiteFunc () {
    io:println("I'm the after suite function!");
}