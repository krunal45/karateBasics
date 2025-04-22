Feature:Create Post
  Background: Generate Token
    Given url 'https://conduit-api.bondaracademy.com'
    Given path 'api/users/login'
    Given request read('conduitAppLoginData.json')
    When method post
    Then status 200
    * def token = response.user.token

  Scenario:Create Article
    Given url 'https://conduit-api.bondaracademy.com'
    Given path 'api/articles'
    * def requestBody =
    """
    {
      "article": {
        "title": "Central Usability Executive6",
        "description": "Test",
        "body": "Test",
        "tagList": [
          "Chief Directives Supervisor4"
        ]
      }
    }
    """
    Given request requestBody
    Given header Authorization = 'Token ' + token
    When method post
    Then status 201
    And match response.article.slug contains 'Central-Usability-Executive6'
    And match response.article.title == requestBody.article.title
    And match response.article.description == requestBody.article.description
    And match response.article.tagList contains requestBody.article.tagList[0]
    And match response.article.author.username == 'krunal'

  Scenario: Create & Delete Article
    Given url 'https://conduit-api.bondaracademy.com'
    Given path 'api/articles'
    * def requestBody =
      """
      {
        "article": {
          "title": "Delete Article",
          "description": "Test",
          "body": "Test",
          "tagList": [
            "Delete Article"
          ]
        }
      }
      """
    Given request requestBody
    Given header Authorization = 'Token ' + token
    When method post
    Then status 201
    * def slug = response.article.slug
#    Checking if article got created
  Given url 'https://conduit-api.bondaracademy.com'
    Given path 'api/articles'
    When method get
    Then status 200
    And match response.articles[0].title == requestBody.article.title
#    Delete Article