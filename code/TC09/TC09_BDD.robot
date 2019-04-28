*** Settings ***
Documentation     A test invalid login. 
...					When someone tries to login without user
Library           Selenium2Library


*** Test Cases ***
When someone tries to login without user
	Given I have chosen to sign up
	When I sign up without user
	Then I should receive a information about invalid data


*** Keywords ***
Given I have chosen to sign up
	Open Browser	https://user.itaka.pl/	Firefox
	Maximize Browser Window
	Set Selenium Speed    1
	Title Should Be    Itaka.pl - Logowanie

When I sign up without user
	Input Text	password	wsbcwicz2018
	Click Element    xpath://html/body/div[2]/div/div/div[2]/div[1]/form/button

Then I should receive a information about invalid data
	Page should Contain	Pole jest wymagane.
	Close Browser