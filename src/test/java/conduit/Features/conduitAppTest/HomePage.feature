@smoke
Feature: Validating Home Page

  Background: Define URL
    Given url conduitAPIEndpoint

  Scenario: Get all Tags
    When method Get
    Then status 200
    And match response == {tags:["implementations","welcome","introduction","codebaseShow","ipsum","qui","et","quia","cupiditate","deserunt"]}
    And match response.tags contains ['welcome','codebaseShow']
    And match response.tags !contains 'truck'
    And match response.tags == '#array'
    And match each response.tags == '#string'
    And match response.tags == '#[10]'


  @skipme
  Scenario: Get first 10 Articles
    * params {limit:10,offset:0}
    Given path '/articles'
    When method Get
    Then status 200
    And match response.articles[0].slug == 'If-we-quantify-the-alarm-we-can-get-to-the-FTP-pixel-through-the-online-SSL-interface!-120863'
    And match response.articles[0].slug != 'If-we-quantify-the-alarm-we-canjdhfjdh'
    And match response.articles[0].slug contains 'If'
    And match response.articles[0].slug contains any 'quantify'
    And match response.articles[0].tagList contains only ["rerum","maiores","omnis"]