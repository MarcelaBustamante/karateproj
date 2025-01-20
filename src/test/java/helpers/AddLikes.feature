Feature: Add likes
    Background:
        Given url apiUrl
    
    Scenario: Add likes to an article
        Given path 'articles', slug, 'favorite'
        And request {}
        When method Post
        Then status 200
        * def likesCount = response.article.favoritesCount

        