@HomePage
Feature:Test for the home page

Background: 
    Given url apiUrl

   
Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Git']
    And match response.tags !contains ['Cars']
    And match response.tags contains any ['Git', 'Java', 'Python']
    And match response.tags == '#array'
    And match each response.tags == '#string'
    
 
Scenario: Get 10 articles from the page
    * def timeValidator = read('classpath:helpers/timeValidator.js')

    Given params { limit: 10, offset: 0 } 
    And path 'articles'
    When method Get
    Then status 200
    #verify that the response has 10 tags
    And match response.articles == '#[10]'
    #example of fuzzy matching
    #And match response..favoritesCount =='#number'
    #validate schema
    And match each response.articles == 
    """
        {
            "slug": "#string",
            "title":"#string",
            "description":"#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",,
            "updatedAt": "#? timeValidator(_)",,
            "favorited": "#boolean",
            "favoritesCount": "#number",
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": "#boolean"
            }
        }
    """
@ignore
Scenario:Conditional logic
    Given params { limit: 10, offset: 0 }
    Given path 'articles'
    When method Get
    Then status 200
    * def favoriteCount = response.articles[0].favoritesCount
    * def article = response.articles[0]
    * if (favoriteCount == 0) karate.call('classpath:helpers/AddLikes.feature', article)
        
    Given params { limit: 10, offset: 0 }
    Given path
    When method Get
    Then status 200
    And match response.articles[0].favoritesCount == 1

Scenario:Retry calls
    # retry the call 3 times with an interval of 5 seconds
    * configure retry = { count: 3, interval: 5000 }
    
    Given params { limit: 10, offset: 0 }
    Given path 'articles'
    And retry until response.articles[0].favoritesCount == 1
    When method Get
    Then status 200

Scenario: Sleep call
    # sleep for 5 seconds
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) } 
    
    Given params { limit: 10, offset: 0 }
    Given path 'articles'
    When method Get
    * eval sleep(5000)
    Then status 200
     