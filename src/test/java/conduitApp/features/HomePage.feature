Feature: Tests for the home Page

  Background:Define Url
    Given url 'https://conduit-api.bondaracademy.com'

  @test @ignore
  Scenario:Get all tags
    Given path 'api/tags'
    When method Get
    Then status 200
    And match response.tags contains ['Test','YouTube']
    And match response.tags !contains 'truck'
    And match response.tags contains any ['Test','AB','CD']
    And match response.tags[0] contains only 'Test'
    And match response.tags == '#array'
    And match each response.tags == '#string'

  @test @ignore
  Scenario: Get all articles
    Given path 'api/articles'
    Given params {limit:2,offset:0}
    When method Get
    Then status 200
    And match response.articles == '#[2]'
    And match response.articlesCount == 10
    And match response.articles[0].title contains 'Discover'
    And match response.articles[0].slug contains 'Bondar'
    And match response.articles[0].tagList contains ['QA Skills']
    And match response.articles[0].tagList contains any ['QA Skills','AB']
    And match response.articles[*].favoritesCount contains 635
    And match response == {"articles":"#array","articlesCount":10}
    And match response..username contains 'Artem Bondar'
    And match each response..following == false
    And match response.articlesCount == '#number'
    And match response.articles == '#[2]'
    And match response.articles[0].slug == '#string'
    And match each response..following == '#boolean'
    And match each response..bio == '##string'

  @test @ignore
  Scenario: Conditional Logic
    Given path 'api/articles'
    Given params {limit:2,offset:0}
    When method Get
    Then status 200
    * def favouritesCount = response.articles[0].favoritesCount
    * def article = response.articles[0]
    #   * if (favouritesCount == 0) karate.call('helpers/AddLikes.feature',article)
    * def likesCount = favouritesCount == 0 ? karate.call('helpers/AddLikes.feature',article).likesCount : favouritesCount

    Given path 'api/articles'
    Given params {limit:2,offset:0}
    When method Get
    Then status 200
    And match response.articles[0].favoritesCount == likesCount

  @test @ignore
  Scenario: Retry Logic
    * configure retry = {count:10,interval:5000}
    Given path 'api/articles'
    Given params {limit:2,offset:0}
    And retry until response.articles[0].favoritesCount == 1
    When method Get
    Then status 200

  @test
  Scenario: Sleep Logic
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    Given path 'api/articles'
    Given params {limit:2,offset:0}
    When method Get
    * eval sleep(2000)
    Then status 200