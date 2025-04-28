Feature:Create Post
  Background: Generate Token
    Given url conduitAPIEndpoint

  @createArticle
  Scenario:Create Article
    Given path 'api/articles'
    * def requestBody =
      """
      {
        "article": {
          "title": "Central Usability Executive8",
          "description": "Test",
          "body": "Test",
          "tagList": [
            "Chief Directives Supervisor4"
          ]
        }
      }
      """
    Given request requestBody
    When method post
    Then status 201
    And match response.article.slug contains 'Central-Usability-Executive6'
    And match response.article.title == requestBody.article.title
    And match response.article.description == requestBody.article.description
    And match response.article.tagList contains requestBody.article.tagList[0]
    And match response.article.author.username == 'krunal'

  @createAndDeleteArticle
  Scenario: Create & Delete Article
    Given path 'api/articles'
    * def requestBody =
      """
      {
        "article": {
          "title": "Delete Article1",
          "description": "Test",
          "body": "Test",
          "tagList": [
            "Delete Article"
          ]
        }
      }
      """
    Given request requestBody
    When method post
    Then status 201
    * def slug = response.article.slug
    #    Checking if article got created
    Given url conduitAPIEndpoint
    Given params {limit:2,offset:0}
    Given path 'api/articles'
    When method get
    Then status 200
    And match response.articles[0].title == requestBody.article.title
    #    Delete Article
    Given url conduitAPIEndpoint
    Given path 'api/articles',slug
    When method 'Delete'
    Then status 200
    #    Make another Get call to verify if article actually got deleted.
    Given url conduitAPIEndpoint
    Given path 'api/articles'
    When method get
    Then status 200
    And match response.articles[0].title != requestBody.article.title