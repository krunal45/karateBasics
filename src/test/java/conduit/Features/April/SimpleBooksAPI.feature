Feature:Simple Books API
#  Background:
#    * def tokenResponse = karate.callSingle('classpath:conduit/Features/April/GenerateAccessToken.feature')
#    * def accessToken = tokenResponse.accessToken
#
#  Scenario:OrderBook
#    #    Step 1 > Create Book
#    Given url 'https://simple-books-api.glitch.me'
#    Given path 'orders'
#    Given header Authorization = 'Bearer ' + accessToken
#    Given request
#      """
#      {
#        "bookId": 1,
#        "customerName": "Aloka1"
#      }
#      """
#    When method post
#    Then status 201
#    And match response.created == true
#    * def orderId = response.orderId
#
#    #  Step2 > Fetch book details
#    Given url 'https://simple-books-api.glitch.me'
#    Given path 'orders/' + orderId
#    Given header Authorization = 'Bearer ' + accessToken
#    When method get
#    Then status 200
#    And match response == {id:'#string',bookId:'#number',customerName:'#string',createdBy:'#string',quantity:'#number',timestamp:'#number'}

  Scenario:Get book orders
    Given url 'https://simple-books-api.glitch.me'
    Given path 'books'
    Given param type = 'non-fiction'
    When method get
    Then status 200
    And match response contains
      """
    [{
      "id": 2,
      "name": "Just as I Am",
      "type": "non-fiction",
      "available": false
    }]
      """
    And match each response contains {id:'#number',name:'#string',type:'#present'}
    And match each response contains  {type:'non-fiction'}
    * assert response[*].type == 'non-fiction'