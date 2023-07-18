Feature: match feature

  Scenario: match == test
    * def myJson = {'name': 'krunal', 'age':31}
    * match myJson == {'age':31, 'name': 'krunal'} // Order of Elements doesn't matter while performing assertion.
    * myJson.rollNo = 1
    * set myJson $.height = 80
    * set myJson.abc[0] = 12
    * set myJson.abc[] = 13
    * set myJson.teacher = {'name': 'teacher A', 'age' : 54, 'married': true}
    * print myJson.teacher
    * match myJson.teacher == {'name': '#ignore', 'age' : 54, 'married': true}// Certain Fields can be ignored while comparing json.

  Scenario: get Users List test
    Given url 'https://reqres.in/'
    Given path 'api','users'
    Given param page = 2
    When method GET
    Then status 200
    * def contentType = responseHeaders['Content-Type'][0]
    And match contentType == 'application/json; charset=utf-8'
    And match response.page == 2
    And match response.total_pages == 2
    * def myJson =
      """
    {
    "id": 7,
    "email": "michael.lawson@reqres.in",
    "first_name": "Michael",
    "last_name": "Lawson",
    "avatar": "https://reqres.in/img/faces/7-image.jpg"
    }
       """
    * match myJson == {"id": 7,"email": "michael.lawson@reqres.in","first_name": "Michael","last_name": "Lawson","avatar": "https://reqres.in/img/faces/7-image.jpg"}

  Scenario: match not Equals
    * def test = { foo: 'bar' }
    * match test != { foo: 'bar' }

  Scenario: setting multiple values
    * set student
      | path | value  |
      | name | 'Adam' |
      | age  | 8      |
    * match student == {'name': 'Adam','age': 8}
    * set students
      | path | value1 | value2 | value3  |
      | name | 'Adam' | 'Bob'  | 'Cerry' |
      | age  | 6      | 8      | 10      |
    * print students
    * match students[1].name == 'Bob'

  Scenario: Remove certain values
    * set students
      | path | value1 | value2 | value3  |
      | name | 'Adam' | 'Bob'  | 'Cerry' |
      | age  | 6      | 8      | 10      |
    * remove students[2]
    * print students
    * delete students[1]['name']
    * delete students[1]['age']
    * print students

  Scenario: Remove certain value
    * set student
      | path | value  |
      | name | 'Adam' |
      | age  | 8      |
    * print student
    * delete student['name']
    * print student

  Scenario: match contains Example 1
    * def foo = { bar: 1, baz: 'hello', ban: 'world' }

    * match foo contains { bar: 1 }
    * match foo contains { baz: 'hello' }
    * match foo contains { bar:1, baz: 'hello' }
# this will fail
# * match foo == { bar:1, baz: 'hello' }

  Scenario: match contains Example 1
    Given url apiBaseURLForReqresFeature
    Given path 'api','users','2'
    When method GET
    Then status 200
    And match response.data contains {"email": "janet.weaver@reqres.in","last_name": "Weaver"}
    And match response.data ==
    """
    {"id": 2,
  "email": "janet.weaver@reqres.in",
  "first_name": "Janet",
  "last_name": "Weaver",
  "avatar": "https://reqres.in/img/faces/2-image.jpg"}
    """

  Scenario: match contains Example 2
    Given url apiBaseURLForReqresFeature
    Given path 'api','users'
    Given param page = 2
    When method GET
    Then status 200
    And match response.data[0] contains {"id": 7,"first_name": "Michael"}

  Scenario: match not contains Example 1
    Given url apiBaseURLForReqresFeature
    Given path 'api','users'
    Given param page = 2
    When method GET
    Then status 200
    And match response.data[1] !contains {"rollNo": 7}
    And match response.data[1] !contains {"id": 8}

  Scenario: match not contains Example 2
    * def foo = { a: 1,b: 2 }
#    * match foo == { a: '#number', b: '#notpresent' }

# if b can be present (optional) but should always be null
    * match foo == { a: '#number', b: '##null' }