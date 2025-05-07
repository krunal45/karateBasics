Feature:Update User
  Background: Pre-Conditions
    * def userId = karate.callonce('ListUsers.feature').userId

  @updateUser
  Scenario:Update User
    Given path 'public/v2/users/',userId
    Given request {"status":"active"}
    When method patch
    Then status 200
    And match response.status == 'active'