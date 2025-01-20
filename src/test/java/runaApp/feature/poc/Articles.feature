@Articles
Feature: Articles

Background: 
    Given url apiUrl
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') 
    * def token = tokenResponse.authToken

    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def articleRequestBody = read('classpath:runaApp/json/newArticleRequest.json')
    * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body

Scenario: create a new article
    #login
    # Given path 'users/login'
    # And request { "user": { "email": "rompecocos7@gmail.com", "password": "123456" } }
    # When method Post
    # Then status 200
    # * def token = response.user.token
    
    #create a new article
    
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    And match response.article.title == articleRequestBody.article.title
    # Get slug article
    * def slug = response.article.slug

    #get article by slug
    Given path 'articles/' + slug
    When method Get
    Then status 200

    #delete article
    Given path 'articles/' + slug
    When method Delete
    Then status 204

    
    #get article by slug to make sure is deleted
    Given path 'articles/' + slug
    When method Get
    Then status 404