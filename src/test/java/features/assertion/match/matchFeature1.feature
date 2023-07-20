Feature: match Feature 1

  Scenario: using match == in json Arrays Example 1
    Given def cat =
  """
  {
    name: 'Billie',
    kittens: [
      { id: 23, name: 'Bob' },
      { id: 42, name: 'Wild' }
    ]
  }
  """
# normal 'equality' match. note the wildcard '*' in the JsonPath (returns an array)
    Then match cat.kittens[*].id == [23, 42]
    Then match cat.kittens[*].name == ['Bob','Wild']

# when inspecting a json array, 'contains' just checks if the expected items exist
# and the size and order of the actual array does not matter
    Then match cat.kittens[*].id contains 23
    Then match cat.kittens[*].id contains [42]
    Then match cat.kittens[*].id contains [23, 42]
    Then match cat.kittens[*].id contains [42, 23]
#
## the .. operator is great because it matches nodes at any depth in the JSON "tree"
    Then match cat..name == ['Billie', 'Bob', 'Wild']
#
## and yes, you can assert against nested objects within JSON arrays !
    Then match cat.kittens contains [{ id: 42, name: 'Wild' }, { id: 23, name: 'Bob' }]
#
## ... and even ignore fields at the same time !
    Then match cat.kittens contains { id: 42, name: '#string' }

#    Sequencing of jsonArray elements does matter while using exact equality operator.
  Scenario: using match == in json Arrays Example 2
    Given url apiBaseURLForReqresFeature
    Given path 'api/users'
    Given param page = 2
    When method GET
    Then status 200
    And match response.data[*].id == [7,8,9,10,11,12]
    And match response.data[*].first_name == ['Michael','Lindsay','Tobias','Byron','George','Rachel']
    And match response.data[*]..last_name contains only ['Ferguson','Funke','Fields','Lawson','Edwards','Howell'] // #    Sequencing of jsonArray elements doesn't matter while using contains only.

  Scenario: using match == in json Arrays Example 3
    Given url animalRestAPI
    Given path 'facts/'
    When method GET
    Then status 200
    And match response[*].user == ['58e007480aac31001185ecef','58e007480aac31001185ecef','588e6e8806ac2b00110e59c3','58e007480aac31001185ecef','58e007480aac31001185ecef']


  Scenario: using match contains in json Arrays Example 2
    Given url animalRestAPI
    Given path 'facts/'
    When method GET
    Then status 200
    And match response..status contains {"verified": true,"sentCount": 1}
    And match response.._id contains '#string'

  Scenario: using match contains in json Arrays Example 1
    Given url apiBaseURLForReqresFeature
    Given path 'api/users'
    Given param page = 2
    When method GET
    Then status 200
    And match response.data[*].first_name contains ['Tobias','Rachel']
    And match response.data[*]..last_name contains ['Funke','Lawson']
    And match response.data[*] contains
    """
    [
  {"id": 7,
  "email": "michael.lawson@reqres.in",
  "first_name": "#ignore",
  "last_name": "Lawson",
  "avatar": "https://reqres.in/img/faces/7-image.jpg"}]
    """

  Scenario: match contains any Example 1
    * def data = { foo: [1, 2, 3] }
    * match data.foo contains any [9, 1, 8]
    * def data = { a: 1, b: 'x' }
    * match data contains any { b: 'x', c: true }
    * def student = {name: 'Joy'}
    * match student contains any {name: 'Joy','age': 20}

  Scenario: match contains any Example 2
    Given url apiBaseURLForReqresFeature
    Given path 'api/users'
    Given param page = 2
    When method GET
    Then status 200
    And match response.data..id contains any [1,3,7]
    And match response.data..first_name contains any ['Michael','abc','jhg']
    And match response contains any {total: '#number',id: 4}