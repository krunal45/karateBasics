Feature:Delete User
  Background: Fetch User Id
    * def userId = karate.callonce('ListUsers.feature').userId

  @deleteUser
  Scenario:Delete User & verify if user got deleted
    Given path 'public/v2/users/' + userId
    When method delete
    Then status 204
    #    Verify if list contains deleted user
    Given path 'public','v2','users'
    When method get
    Then status 200
    And match each response..id != userId
    And match each response..id == '#number'
    And match each response..name == '#string'
    And match each response..email == '#string'
    And match each response..gender == '#string'
    And match each response..status == '#string'
    * match karate.response.header('Content-Type') contains 'application/json'
    * match karate.response.header('Connection') == 'keep-alive'