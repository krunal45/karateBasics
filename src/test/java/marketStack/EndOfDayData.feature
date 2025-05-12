Feature:End of Day Data

  @test
  Scenario:Get End Of Day Data
    Given path 'v2/eod'
    Given params {symbols: 'AAPL',access_key:'99db03f700f0fc68678a7752c1c87094'}
    When method get
    Then status 200
    And match response.pagination.limit == 100
    And match response.pagination.offset == '#number'
    And match response.data == '#array'
    And match each response.data[*].open == '#number'
    And match response.data == '#[100]'