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

  @test
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