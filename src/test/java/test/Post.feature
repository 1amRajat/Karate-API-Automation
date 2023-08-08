Feature: Post API

Background:
	* url 'https://reqres.in/api'
	* headers Accept = 'application/json'
	* def responseOutput = read('response1.json')

Scenario: API Name1 - Post API with read data from file 

Given path '/users'
And request {"name": "Rajat","job": "leader"}
When method post
Then status 201
#And match response == responseOutput
And print responseTime 
And print response

Scenario: API Name2 - Post scenario with request and response from a file

Given path '/users'
And def requestInput = read('request1.json')
And request requestInput
When method post
Then status 201
And match response == responseOutput
And print response


Scenario: API Name3 - Post scenario read input from file and change data in feature

Given path '/users'
And def requestInput = read('request1.json')
And set requestInput.name = 'New Bot User'
And request requestInput
When method post
Then status 201
And def responseOutput2 = read('response2.json')
And match response == responseOutput2
And print response
