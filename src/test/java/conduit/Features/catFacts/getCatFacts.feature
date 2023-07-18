Feature: getCatFacts

  Background: Hit End point
    Given url 'https://cat-fact.herokuapp.com/'

  @schemaValidationTest
  Scenario: get Cat Facts
    * def validateTime = read('classpath:helpers/getTime.js')
    Given path 'facts/'
    When method Get
    Then status 200
    And match each response ==
    """
    {
        "status": {
            "verified": '#boolean',
            "sentCount": '#number'
        },
        "_id": '#string',
        "user": '#string',
        "text": '#string',
        "__v": '#number',
        "source": '#string',
        "updatedAt": '#? validateTime(_)',
        "type": '#string',
        "createdAt": '#? validateTime(_)',
        "deleted": '#boolean',
        "used": '#boolean'
    }
    """