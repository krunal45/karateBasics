Feature: create Token
  Scenario: Create Authorization Token
    Given url conduitAPIEndpoint
    Given path 'api/users/login'
    Given request
      """
      {
        "user": {
          "email": "#(userName)",
          "password": "#(password)"
        }
      }
      """
    When method post
    Then status 200
    * def token = response.user.token