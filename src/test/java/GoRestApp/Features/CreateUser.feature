Feature:Create User
  Background: Data Generation
    * def data = Java.type('helpers.DataGenerator')
    * def userName = data.getRandomName()
    * def userEmail = data.getRandomEmail()

  @createUser
  Scenario:Create User And Verify if User got created.
    Given path 'public/v2/users'
    * def requestBody =  read('Json/CreateUser.json')
    * set requestBody.name = userName
    * set requestBody.email = userEmail
    Given request requestBody
    When method post
    Then status 201
    * def createUserId = response.id
    Given path 'public','v2','users'
    When method get
    Then status 200
    And match response[0].id == createUserId
    And match response[0].name == requestBody.name
    And match response[0].email == requestBody.email
    And match response[0].gender == 'male'
    And match response[0].status == 'active'