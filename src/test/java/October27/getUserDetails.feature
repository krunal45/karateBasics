Feature: Get User Details

  Scenario: Getting user List
    Given url goRest
    When method GET
    Then status 200
    * def responseID = response[0].id
    * print 'ID :' + responseID

  Scenario: Getting specific user Detail
    Given url goRest
    Given path '32'
    When method GET
    Then status 200
    * def ID = response.id
    * def name = response.name
    * def email = response.email
    * def gender = response.gender
    * def status = response.status
    * match ID == 5507767
    * match name == 'Msgr. Kumari Mahajan'
    * match email == 'mahajan_msgr_kumari@monahan-grant.test'
    * match gender == 'male'
    * match status == 'Inactive'

  Scenario: Get Active Users
    Given url goRest
    * def query = {status: 'active',id: 5536172}
    And params query
    When method GET
    Then status 200
    Then match response[0].name == 'Chaturaanan Johar DVM'
    Then match response[0].email == 'chaturaanan_dvm_johar@baumbach.test'

  Scenario: age Prediction
    Given url 'https://api.agify.io/'
    And param name = 'meelad'
    When method GET
    Then status 200
    Then match response.name == 'meelad'
    Then match response.count == 21
    Then match response.age == 33