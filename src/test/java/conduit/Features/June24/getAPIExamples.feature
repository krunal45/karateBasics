Feature: get List of Users

  Scenario: Validating get Response of API
    Given url goRest
    When path 'public/v2/users'
    Then method get
    And status 200
#    Then match response[0].id == 3195690
    Then match response == '#array'
#    And match response[0] contains {"id": 3195690,"name": "Deepan Bandopadhyay"}
#    And match response[0] contains any {"id":3195690,"id1":3195691}
#    And match response[0] contains only {"id": 3195690,"name": "Deepan Bandopadhyay","email": "bandopadhyay_deepan@walter-schmitt.example","gender": "female","status": "active"}
#    And match response contains deep {"id": 3195678,"name": "Dharani Panicker"}
    And match each response == {"id": "#number","name": "#string","email": "#string","gender": "#string","status": "#string"}

  Scenario: get User Details
    Given url goRest
    When path '/public/v2/users/3195664'
    Then method get
    And status 200
    Then match response ==
     """
  {
  "id": '#number',
  "name": "#ignore",
  "email": "#string",
  "gender": "#string",
  "status": "#string"
  }
  """
    Then match response contains {"maritalStatus": "#notpresent"}
#    Then match response.name == 'Dharani Panicker'
#    Then match response.name contains 'Panicker'
#    And match response.email == '#string'

#  Match each contains deep :
  Scenario: Match each contains deep
#    * def myJson =
#  """
#  [{'name':'Krunal',
#  'age': 31,
#  'ocuupation': 'QA',
#   'student': [{'name': 'adam','rollNo': 1}]}]
#    """
#    Then match each myJson contains deep {'name': 'Krunal','student': [{'rollNo': 1}]}
    * def student = [{'name': 'ajay','age': 7,'standard': '5th','rollNo': 21},{'name': 'bob','age': 7,'standard': '5th','rollNo': 22}]
    * def schema = {'name': '#string','age': '#number','standard': '#string','rollNo': '#number'}
    * def partSchema = {'name': '#string','rollNo': '#number'}
    * def mixSchema = {'name': '#string','DOB': '#string'}
    * match each student == '#(schema)'
    * match each student == '#(^partSchema)'
    * match each student == '#(^*mixSchema)'
    * match each student == '#(^^schema)'

    #Matching headers
  Scenario: Getting usersList
    Given url apiBaseURLForReqresFeature
    Given path 'api/users'
    Given param page = 2
    When method GET
    Then status 200
    And match header Content-Type contains 'application/json'
    And match header server == 'cloudflare'
    And match response.data[0].email == '#regex ^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
