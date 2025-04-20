Feature: Request Headers feature

  Background: Pre-requisite
    Given path '/users'
    * def Token = authToken
    * configure url = 'https://gorest.co.in/public/v2'
    * configure headers = { 'Content-Type': 'application/json'}

  Scenario: Example 1
    Given header Authorization = authToken
    When method GET
    Then status 200

  Scenario: Example 2
    Given header Cache-Control = 'no-cache'
    When method GET
    Then status 200

  Scenario: Example 3
    * def myHeader = {'Cache-Control' :'no-cache'}
    Given headers myHeader
    When method GET
    Then status 200