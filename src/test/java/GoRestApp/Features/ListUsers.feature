Feature:List Users

  @test
  Scenario:List Users
    Given path 'public','v2','users'
    When method get
    Then status 200
    And match each response ==
      """
      {
        "id": '#number',
        "name": "#string",
        "email": "#string",
        "gender": "#string",
        "status": "#string"
      }
      """
    * def userId = response[0].id