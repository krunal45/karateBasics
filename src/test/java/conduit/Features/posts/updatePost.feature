@updatePostFeature
Feature: update Post

  Background:get iD to be Updated
  * def getIDToken = callonce read('getCreatedPosts.feature')
  * def iDToBeUpdated = getIDToken.userID
  Given url apiBaseURLForPostFeature

  @updatePost
  Scenario: update Post based on ID
    * def postDetails = {"id":1 ,"title": "updateTest2","body": "bar"}
    Given path 'posts',iDToBeUpdated
    Then request
    """
    {"id":'#postDetails.id',
    "title": '#(postDetails.title)',
    "body": '#(postDetails.body)',
    "userId": '#(iDToBeUpdated)'}
    """
    When method PUT
    And status 200
    And match response.id == 1
    And match response.title == "updateTest2"

  @updateTitle
  Scenario: update title based on ID
    Given path 'posts',iDToBeUpdated
    When request {"title": "Only Title Update"}
    Then method Patch
    And status 200
    And match response.title == 'Only Title Update'