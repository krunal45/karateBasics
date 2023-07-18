Feature: get booking IDS

  Scenario: get list of Booking IDS
    Given url restFulBooker + '/booking'
    When method GET
    Then status 200
    And match response == '#array'
    And match response[0].bookingid == '#number'
    * def bookingID = response[0].bookingid
    * print bookingID

#  Scenario: get bookingInfo from booking ID
#    * print bookingID
#    Given url restFulBooker + '/booking/'+bookingID
#    When method GET
#    Then status 200
#    And match response ==
#    """
#{
#  "$schema": "http://json-schema.org/draft-04/schema#",
#  "type": "object",
#  "properties": {
#    "firstname": {
#      "type": "string"
#    },
#    "lastname": {
#      "type": "string"
#    },
#    "totalprice": {
#      "type": "integer"
#    },
#    "depositpaid": {
#      "type": "boolean"
#    },
#    "bookingdates": {
#      "type": "object",
#      "properties": {
#        "checkin": {
#          "type": "string"
#        },
#        "checkout": {
#          "type": "string"
#        }
#      },
#      "required": [
#        "checkin",
#        "checkout"
#      ]
#    },
#    "additionalneeds": {
#      "type": "string"
#    }
#  },
#  "required": [
#    "firstname",
#    "lastname",
#    "totalprice",
#    "depositpaid",
#    "bookingdates",
#    "additionalneeds"
#  ]
#}
#  """