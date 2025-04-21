Feature:

  Scenario:Validate entire json response
    Given url 'https://reqres.in/api/users'
    And request read('createUser.json')
    When method POST
    Then status 201
    And match response ==
    """
    {
    "name": "morpheus",
    "job": "leader",
    "id": "#present",
    "createdAt": "#present"
    }
     """

@ignore
  Scenario:Validate specific field value
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response.name == 'morpheus'
    And match response.job == 'leader'