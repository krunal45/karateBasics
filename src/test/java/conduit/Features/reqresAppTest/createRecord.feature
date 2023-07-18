@createUpdateRecord
Feature: create/edit Record

  Background: Hit Base URL
    * def jsonRequestBody = read('classpath:testData/requestBody.json')
    * def randomData = Java.type('helpers.DataGenerator')
    * def randomName = randomData.getRandomName()
    * def randomSalary = randomData.getRandomSalary()
    * def randomAge = randomData.getRandomAge()
    * set jsonRequestBody.name = randomName
    * set jsonRequestBody.salary = randomSalary
    * set jsonRequestBody.age = randomAge
    Given url apiBaseURLForReqresFeature

#    * def recordID = response.data.id

  @createRecord
  Scenario: create new Record in Database
    Given path 'v1/create'
    When request jsonRequestBody
    Then method Post
    And status 201
    And match response.name == jsonRequestBody.name
    And match response.salary == jsonRequestBody.salary
    And match response.id == '#string'

  @updateRecord
  Scenario: update existing Record in Database
    Given path 'v1/update/1'
    When request jsonRequestBody
    Then method Put
    And status 200
    And match response.name == jsonRequestBody.name
    And match response.salary == jsonRequestBody.salary