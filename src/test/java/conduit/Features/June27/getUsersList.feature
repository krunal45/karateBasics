Feature: get Users List

  Scenario: getting list of users
    Given url 'https://reqres.in'
    Given path 'api/users/'
    Given param page = 2
    When method GET
    Then status 200
    And match header Content-Type contains 'application/json'
    And match header Transfer-Encoding == 'chunked'
    And match each response.data == {'id':'#number','email': '#string', 'first_name':'#string','last_name':'#string','avatar': '#string'}
    And match each response.data == '#array'
    * def userID = response.data[0].id





#  {
#  "id": 7,
#  "email": "michael.lawson@reqres.in",
#  "first_name": "Michael",
#  "last_name": "Lawson",
#  "avatar": "https://reqres.in/img/faces/7-image.jpg"
#  }