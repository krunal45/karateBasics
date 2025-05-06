Feature:Add Likes
  Background:PreConditions
    * url conduitAPIEndpoint

  Scenario:Add Likes
    Given path 'api/articles/' + slugId + '/favorite'
    When request {}
    When method post
    Then status 200
    * def likesCount = response.article.favoritesCount