Feature: Create Token

    Scenario: Generate a new token
        Given url apiUrl
        And path 'users/login'
    And request { "user": { "email": "#(userEmail)", "password": "#(userPassword)" }}
        When method Post
        Then status 200
        * def authToken = response.user.token