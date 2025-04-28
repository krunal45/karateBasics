Feature:Sign Up User
  Background: Pre-conditions
    Given url 'https://conduit-api.bondaracademy.com'

  Scenario:New User Sign Up
    Given def userData = {"email":"K-B3@test.com","username":"TestUserK-B32"}
    Given path 'api/users'
    When request {"user":{"email":"#(userData.email)","password":"Test@123","username":"#(userData.username)"}}
    When method post
    Then status 201