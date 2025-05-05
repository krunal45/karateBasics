Feature:Sign Up User
  Background: Pre-conditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def email = dataGenerator.getRandomEmail()
    * def username = dataGenerator.getRandomName()
    Given url 'https://conduit-api.bondaracademy.com'

  @test @ignore
  Scenario:New User Sign Up
    Given path 'api/users'
    When request {"user":{"email":"#(email)","password":"Test@123","username":"#(username)"}}
    When method post
    Then status 201
    And match response ==
      """
      {
        "user": {
          "id": '#number',
          "email": "#(email)",
          "username": "#(username)",
          "bio": null,
          "image": "#string",
          "token": "#string"
        }
      }
      """

  @test
  Scenario Outline: Error Scenarios check
    Given path 'api/users'
    When request {"user":{"email":"<email>","password":"<password>","username":"<username>"}}
    When method post
    Then status 422
    And match response == <errorMessage>
    Examples:
      | username     | email            | password | errorMessage                                       |
      | #(username)  | Rickey@gmail.com | Test@123 | {"errors":{"email":["has already been taken"]}}    |
      | ethan.beatty | #(email)         | Test@123 | {"errors":{"username":["has already been taken"]}} |