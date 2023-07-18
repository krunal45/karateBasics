Feature: list Users

  Scenario: list existing Users
    * def RequestHeaders = {Authorization: '#(authToken)'}
    Given url goRest + 'v2/users'
    When method GET
    Then status 200
    And match response contains
    """{
  "id": 2272519,
  "name": "Tanushree Devar Jr.",
  "email": "devar_jr_tanushree@kozey.example",
  "gender": "female",
  "status": "inactive"
  }
  """