Feature: Get Users List

  Scenario: Get list of all users available in system
    Given url apiBaseURLForReqresFeature
    Given path '/api/users'
    Given param page = 2

    When method GET
    Then status 200
    * def userID = response.data[0].id
    * print userID