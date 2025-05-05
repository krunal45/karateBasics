Feature:Create Post
  Background: Generate Token
    Given url conduitAPIEndpoint
    * def requestBody = read('classpath:conduitApp/Json/createArticle.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * set requestBody.article.title = dataGenerator.getNewArticle().title
    * set requestBody.article.description = dataGenerator.getNewArticle().description
    * set requestBody.article.body = dataGenerator.getNewArticle().body

  @createArticle
  Scenario:Create Article
    Given path 'api/articles'
    Given request requestBody
    When method post
    Then status 201
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