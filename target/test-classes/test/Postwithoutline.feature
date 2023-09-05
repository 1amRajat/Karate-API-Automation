Feature: Post API with scenario outline

Background:
	* url 'https://reqres.in/api'
	* headers Accept = 'application/json'
	* def responseOutput = read('response1.json')
	
	
Scenario Outline: Validate Post API with Different user dynamically
    Given path '/users'
		And def requestInput = read('request1.json')
		And set requestInput.name = '<name>'
		And set requestInput.job = '<job>'
		And request requestInput
    When method post
    Then status 201
    And print response
    And def responseOutput2 = read('response2.json')
    And set responseOutput2.name = '<name>'
    And set responseOutput2.job = '<job>'
    And print responseOutput2
    And match response == responseOutput2

    Examples: 
      | name  	| job    |
      | Rajat 	| leader |
      | Karmakar| worker |
