Feature: get user Detail

  Scenario: get Specific User
    * def expectedSchema =
  """
  {
  "data": {
  "id": '#number',
  "email": "#string",
  "first_name": "#string",
  "last_name": "#string",
  "avatar": "#string"
  },
  "support": {
  "url": "#string",
  "text": "#string"
  }
  }
  """
    * def getUserList = call read('getUsersList.feature')
    * def id = getUserList.userID
    Given url 'https://reqres.in/'
    Given path '/api/users'+ id
    When method get
    Then status 200
    And match response == expectedSchema