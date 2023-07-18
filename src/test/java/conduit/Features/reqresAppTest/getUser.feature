@parallel=False
Feature: get Specific User Details

  Background: Test preConditions
    * configure headers = { 'Content-Type': 'application/json' }
    * def userList = call read('getUsersList.feature')

  Scenario: get Specific User Detail
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
    * def id = userList.userID
    Given url 'https://reqres.in/api/'
    When path 'users/'+id
    And retry until id < 7
    Then method GET
    And status 200
    And match header Server == 'cloudflare'
    And match header Content-Type contains 'application/json'
    And match response == expectedSchema