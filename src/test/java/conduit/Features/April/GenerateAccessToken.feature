Feature:Generate Access Token

  Scenario:Register Client
    Given url 'https://simple-books-api.glitch.me'
    Given path 'api-clients'
    Given request
      """
      {
        "clientName": "Erika",
        "clientEmail": "Marta53@hotmail.com"
      }
      """
    When method post
    Then status 201
    * def accessToken = response.accessToken
    * karate.set('accessToken', accessToken)