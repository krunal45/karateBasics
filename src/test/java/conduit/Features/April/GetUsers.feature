Feature:Get Users
#
#@skip-me
#  Scenario:Validate User Details
#  Given url 'https://reqres.in'
#  Given path '/api/users'
#  Given param page = 2
#  When method GET
#  Then status 200
#  And assert response.page == 2
#
# Scenario: Create User
# Given url 'https://jsonplaceholder.typicode.com'
# Given path '/posts'
# Given request
# """
# {
# "title": "foo",
# "body": "bar",
# "userId": 1
# }
# """
# When method post
# Then status 201
# And match response.title == 'foo'
# And match response.body == 'bar'
# And match response.userId == 1
# And match response contains {id:'#present'}

# Scenario: get User
#
#  Given url 'https://jsonplaceholder.typicode.com'
#  Given path 'posts'
#  Given param id = 1
#  When method get
#  Then status 200
#  And match response[0] == {userId:'#number',id:'#number',title:'#string',body:'#string'}
#  And match response[0] contains {userId:1,title:'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'}

  Scenario: get User List

  Given url 'https://reqres.in'
  Given path 'api/users'
  Given param page = 2
  When method get
  Then status 200
  And match response.page == 2
  And match response.per_page == 6
  And match response contains {data:'#array'}
  And match response.data[0] contains {id:'#number'}
  And match response.data[0].email == 'michael.lawson@reqres.in'
  And match response.data[0].first_name == 'Michael'