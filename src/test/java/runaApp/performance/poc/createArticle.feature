@Articles
Feature: Articles

Background: 
    Given url apiUrl
    # * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') 
    # * def token = tokenResponse.authToken

    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def articleRequestBody = read('classpath:runaApp/json/newArticleRequest.json')
    * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body

    * def sleep = function(ms){ java.lang.Thread.sleep(ms) }
    * def pause = karate.get('__gatling.pause', sleep)

Scenario: create a new article
    
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    And match response.article.title == articleRequestBody.article.title
    # Get slug article
    * def slug = response.article.slug

    * pause(1000)

    #delete article
    Given path 'articles/' + slug
    When method Delete
    Then status 204