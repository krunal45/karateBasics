Feature: create User

  Background: preConditions
    * configure headers = { 'Content-Type': 'application/json' }
#    * configure afterScenario = function(print 'after Scenario')
#    * configure afterFeature = function(print 'after Feature')

  Scenario Outline: creating new user in system
    Given url apiBaseURLForReqresFeature
    Given path 'api/users'
    When request { name:'#(name)', job: '#(job)' }
    When method POST
    Then status 201
    And match response.id == '#string'
    Examples:
    |read('testData.csv')|

    @envnot='dev'
    Scenario: get specific user
      Given url apiBaseURLForReqresFeature
      Given path 'api/users/2'
      When method get
      Then status 200
