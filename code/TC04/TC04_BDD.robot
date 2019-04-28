*** Settings ***
Documentation	Login test uses valid data (username and password).
...				Test confirms that it is possible to login to itaka account.
...				This test and test with invalid data are complement each other.
...				Method: Keyword-driven
Library			Selenium2Library
Suite Teardown	Close Browser

*** Test Cases ***
Addition
	Given browser opened on login page
	When user types login and password on the login page
	and user push "Zaloguj"
	Then result is login as a client.

*** Keywords ***
Given browser opened on login page
	Open Browser					https://www.itaka.pl/	Firefox
	Maximize Browser Window
	Wait Until Element Is Visible	xpath://html/body/header/section/div/div[2]/ul/li[5]/a[1]/span
	Click Element					xpath://html/body/header/section/div/div[2]/ul/li[5]/a[1]/span
	Wait Until Element Is Visible	xpath://html/body/header/section/div/div[2]/ul/li[5]/div[1]/a
	Click Element					xpath://html/body/header/section/div/div[2]/ul/li[5]/div[1]/a
	Wait Until Page Contains Element	_username
	Title Should Be					Itaka.pl - Logowanie
	
When user types login and password on the login page
	Input Text						_username			wsbjustyna@wp.pl
	Input Text						_password			wsbcwicz2018
	
and user push "Zaloguj"
	Click Element					xpath://html/body/div[2]/div/div/div[2]/div[1]/form/button
	
Then result is login as a client.
	Wait Until Page Contains Element	xpath://html/body/header/section/div/div[2]/ul/li[5]/a/span
	Click Element						xpath://html/body/header/section/div/div[2]/ul/li[5]/a/span
	Wait until Page Contains Element	xpath://html/body/header/section/div/div[2]/ul/li[5]/div/ul/li[1]/a/span