Feature:GORest API
  Background:
    * def accessToken = 'Bearer 3345dbb24f1d49db4a482b6eeb11ae938320b54a6fa505903863fca4befef311'
    * def randomData = Java.type('helpers.DataGenerator')
#    * def baseUrl = 'https://gorest.co.in'

  @listUsers
  Scenario:List Users
    Given url goRest
    Given path 'public/v2/users'
    Given header Authorization = accessToken
    When method get
    Then status 200
    And match response == '#array'
    And match response contains [{id:'#number',name:'#string',email:'#string',gender:'#string',status:'#string'}]

  @createUser
  Scenario:Create User
    Given url goRest
    Given path 'public/v2/users'
    Given header Authorization = accessToken
    Given request
      """
      {
        "name": "abc",
        "gender": "male",
        "email": "abc1@gmail.com",
        "status": "active"
      }
      """
    When method post
    Then status 201
    And match response == {id:'#number',name:'#string',email:'#string',gender:'#string',status:'#string'}
    And match response contains {name:'Tenali Ramakrishna',gender:'male',status:'active'}
    * def userId = response.id
    #    Updating user name
    Given url goRest
    Given path 'public/v2/users/' + userId
    Given header Authorization = accessToken
    Given request {"name": "Allasani Peddana1"}
    When method patch
    Then status 200
    And match response contains {"name": "Allasani Peddana1"}
  #Delete User
    Given url baseUrl
    Given path 'public/v2/users/'+ userId
    Given header Authorization = accessToken
    When method delete
    Then status 204