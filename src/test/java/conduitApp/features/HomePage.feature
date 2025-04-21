Feature: Tests for the home Page

Background:Define Url
Given url 'https://conduit-api.bondaracademy.com'

Scenario:Get all tags
    Given path 'api/tags'
    When method Get
    Then status 200
    And  match response.tags contains ['Test','Coding']
    And match response.tags !contains 'truck'
    And match response.tags == '#array'
    And match each response.tags == '#string'

@2
Scenario: Get all articles
    Given path 'api/articles'
    Given params {limit:10,offset:0}   
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 10
    And match response.articles[0].title contains 'Discover'