Feature: create Token
Scenario: Create Authorization Token
    Given url apiUrl
    Given path 'users/login'
    When request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
    When method Post
    Then status 200
    * def tokenAuth = response.user.token
