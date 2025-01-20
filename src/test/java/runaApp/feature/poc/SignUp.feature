# @parallel=false
Feature:    Sign Up new user

Background:
   * def dataGenerator = Java.type('helpers.DataGenerator')
   * def timeValidator = read('classpath:helpers/TimeValidator.js')
    Given url apiUrl
   
    Scenario: Sign up new user
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()

    Given path 'users'
    And request
    """
    {
        "user": {
            "email": "#(randomEmail)",
            "password": "123456",
            "username": "#(randomUsername)",
        }
    }
    """
    When method Post
    Then status 201
    And match response ==
    """
    {
        "user": {
            "id": "#number",
            "email": "#(randomEmail)",
            "username": "#(randomUsername)",
            "bio": null,
            "image": "##string",
            "token": "#string"
        }
    }
    """
    
    
    Scenario Outline: Sign up new user with existing email
        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUsername = dataGenerator.getRandomUsername()

        Given path 'users'
        And request
        """
        {
            "user": {
                "email": "<email>",
                "password": "<password>",
                "username": "<username>",
            }
        }
        """
        When method Post
        Then status 422
        And match response == <errorResponse>

        Examples:
        | email          | password     | username      | errorResponse |
        | #(randomEmail) | Karate123    | KarateUser123 | {"errors": {"username": ["has already been taken"]}} |
    | KarateUser1@test.com | Karate123    | #(randomUsername) | {"errors": {"email": ["has already been taken"]}} |