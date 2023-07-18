Feature: create New User

  @Parallel='False'
  Scenario Outline: create New User
    * def randomData = Java.type('helpers.DataGenerator')
    * def randomName = randomData.getRandomName()
    * def randomEmail = randomData.getRandomEmail()
    * def RequestHeaders = {Authorization: '#(authToken)'}
    Given url goRest + '/public/v2/users'
    * headers RequestHeaders
    * def requestBody = read('createUserRequestBody.json')
    When request requestBody
    Then method post
    And status 201
    * match response.id == '#number'
    * match response.name == '#string'
    * match response.email == '#string'
    * match response.gender == '#string'
    * match response.status == '#string'
    Examples:
      | gender | status |
      | male   | active |