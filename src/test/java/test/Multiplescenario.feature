Feature: Post API with scenario outline

Background:
	* url 'https://dummy.restapiexample.com/api/v1'
	* def responseOutput = read('classpath:Testdata/response1.json')
	

Scenario Outline: Validate Post API with Different user dynamically
    Given path '/create'
		And def requestInput = read('classpath:Testdata/request2.json')
		And set requestInput.name = '<name>'
		And set requestInput.salary = '<salary>'
		And request requestInput
		And print requestInput
    When method post
    Then status 200
    And print response
    And def responseOutput2 = read('classpath:Testdata/response2.json')
    And set responseOutput2.data.name = '<name>'
    And set responseOutput2.data.salary = '<salary>'
    And print responseOutput2
    And match response == responseOutput2
    And def name_i = response.data.name
    And print name_i
    
    
    Given path '/employees'
    When method GET
		Then status 200 
		And print response

    Examples: 
      | name  				| salary |
      | Tiger Nixon 	| 320800 |
      | Bradley Greer | 132000 |
