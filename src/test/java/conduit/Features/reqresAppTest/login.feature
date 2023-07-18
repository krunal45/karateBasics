@readCSVFileTest
Feature: login

  Background: Hit Endpoint Url
    * def requestBody = read('classpath:testData/loginRequestBody.json')
    Given url apiBaseURLForReqresFeature

@loginCSVTest
  Scenario Outline: validate login functionality for multiple Users
    Given path 'login'
    * print requestBody
    When request requestBody
    Then method Post
    Then status 200
    Examples:
      | read('classpath:testData/testData.csv') |