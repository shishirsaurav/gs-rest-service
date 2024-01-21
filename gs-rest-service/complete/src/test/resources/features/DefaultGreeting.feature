Feature: Default Greeting
    Background:
        Given the application is running

    Scenario: Get a default greeting
        Given the application is running
        When a GET request is made to "/greeting"
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, World!"

    Scenario: Get a personalized greeting
        Given the application is running
        When a GET request is made to "/greeting" with parameter "name" set to "John"
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, John!"

    Scenario: Get a greeting with a specific name
        Given the application is running
        When a GET request is made to "/greeting" with parameter "name" set to "Alice"
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, Alice!"

    Scenario: Get a default greeting when name parameter is not provided
        Given the application is running
        When a GET request is made to "/greeting" without providing the "name" parameter
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, World!"

    Scenario: Handle invalid input gracefully
        Given the application is running
        When a GET request is made to "/greeting" with an invalid parameter
        Then the response status code should be 400
        And the response contains an error message


    Scenario: Get a greeting with a long name
        When a GET request is made to "/greeting" with parameter "name" set to a long name
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, {name}"

    Scenario: Get a greeting with special characters in the name
        When a GET request is made to "/greeting" with parameter "name" set to a special character string
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, {name}"

    Scenario: Get a personalized greeting with multiple names
        When a GET request is made to "/greeting" with parameter "name" set to "John Doe"
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, John Doe!"

    Scenario: Get a greeting with an empty name
        When a GET request is made to "/greeting" with an empty "name" parameter
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, World!"

    Scenario: Get a personalized greeting with non-ASCII characters
        When a GET request is made to "/greeting" with parameter "name" set to a non-ASCII name
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, {name}"

    Scenario: Get a greeting with a very large name
        When a GET request is made to "/greeting" with parameter "name" set to a very large name
        Then the response status code should be 200
        And the response contains a JSON object with "id" and "content" fields
        And the "id" field should be a positive integer
        And the "content" field should be "Hello, {truncated_name}"
