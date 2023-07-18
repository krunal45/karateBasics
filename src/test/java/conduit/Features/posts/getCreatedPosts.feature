@parallel=false @getPosts
Feature: get List of Created Posts

#  Background: Hit Endpoint Url
#    Given url apiBaseURLForPostFeature


  Scenario: get All Posts
    Given path 'posts'
    When method Get
    Then status 200
    And match response[*].title contains ['eos dolorem iste accusantium est eaque quam','sunt aut facere repellat provident occaecati excepturi optio reprehenderit']
    * def userID = response[0].userId

  @getSpecificPost
  Scenario: get specific Post
    Given param id = 1
    And path 'posts'
    Then method Get
    And status 200
#    Assertions
    And match response == '#array'
    And match response[0].title contains 'sunt'
    And match response[0].title == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'
    And match response[0].title != 'aunt aut facere repellat provident occaecati excepturi optio reprehenderit'

  @matchHeadersCheck
  Scenario: get specific Post
    Given url apiBaseURLForPostFeature
    Given param id = 1
    When path 'posts'
    Then method Get
    And status 200
    Then match header Date contains 'Fri, 28 Apr 2023'
    And match header Content-Type == 'application/json; charset=utf-8'

  @containsDeepCheck
  Scenario: check Nested Json
    * def myJson = {a: 1,b: 2,names: {name1:'Krunal',name2:'Joy',name3: 'Jay'}}
    * def expected = {a:1,names:{name1:'Krunal',name3: 'Jay'}}
    * match myJson contains deep expected
    * match myJson contains only deep expected

  @matchEachUseCase
  Scenario: check match Each Functionality
    * def user = {users:[{id:  01, name: 'Krunal', age: 21},{id:  02, name: 'Hiren', age: 22},{id:  03, name: 'Anjali', age: 23}]}
    * match each user.users == {id: '#number',name: '#string',age: '#number'}
    * match each user.users contains {name: '#string'}
    * match each user.users !contains {name:  'Ashok'}
    * match each user.users contains {age: '#number'}
    * match each user.users contains {id: '#notnull'}
#    * match each user.users contains any ['Krunal','Ashok']

  @fuzzyMatchingCheck
  Scenario: fuzzyMatch Check
    * def students = {student : [{rollNo: 01,name: 'RAHUL',height: 120,weight: 45},{rollNo: 02,name: 'KRUNAL',height: 125,weight: 47}]}
    * match each students.student contains deep {rollNo: '#number',name: '#string'}

  Scenario: Retry scenario test
    * configure retry = {count: 10, interval: 4000}
    Given url 'https://reqres.in/api/users?page=2'
    When retry until responseStatus == 200
    Then method GET

  Scenario: Sleep call
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    Given url 'https://reqres.in/api/users?page=2'
    When retry until responseStatus == 200
    * eval sleep(5000)
    Then method GET