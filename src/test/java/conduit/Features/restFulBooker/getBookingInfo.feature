Feature: Getting bookingInfo From Booking ID

  Scenario: Get bookingInfo From Booking ID
    * configure ssl = true
    * def getBookingIDS = call read('getBookingIDS.feature')
    Given url restFulBooker + '/booking/'+ getBookingIDS.bookingID
    When method GET
    Then status 200
    And match response ==
    """
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "firstname": {
      "type": "string"
    },
    "lastname": {
      "type": "string"
    },
    "totalprice": {
      "type": "integer"
    },
    "depositpaid": {
      "type": "boolean"
    },
    "bookingdates": {
      "type": "object",
      "properties": {
        "checkin": {
          "type": "string"
        },
        "checkout": {
          "type": "string"
        }
      },
      "required": [
        "checkin",
        "checkout"
      ]
    },
    "additionalneeds": {
      "type": "string"
    }
  },
  "required": [
    "firstname",
    "lastname",
    "totalprice",
    "depositpaid",
    "bookingdates",
    "additionalneeds"
  ]
}
  """