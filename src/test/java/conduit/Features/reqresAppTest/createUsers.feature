Feature: create Users

  Background: Hit Base URL
    Given url apiBaseURLForReqresFeature

  Scenario Outline: Creating Users
    Given path 'api/users'
    When method POST
    Then request {"name": '<name>',"job": '<job>'}
    And status 201
#    Assertions
   # Check if name and job in response matches as per request
    And print response
    And match response.id == '#string'
    And match response.createdAt == '#string'
    Examples:
      | name     | job    |
      | morpheus | leader |
      | Jay      | QA     |
      | Joy      | Dev    |

  Scenario Outline: Register User
    Given path 'api/register'
    When method Post
    Then request {"email": '<email>',"password":'<password>'}
    And status 201
    Examples:
      | email              | password |
      | eve.test@reqres.in | pistol   |
      | testUser1@test.com | test123  |
      | testUser2@test.com | test321  |