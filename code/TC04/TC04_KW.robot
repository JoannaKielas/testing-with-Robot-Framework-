*** Settings ***
Documentation	Login test uses valid data (username and password).
...				Test confirms that it is possible to login to itaka account.
...				This test and test with invalid data are complement each other.
...				Method: Keyword-driven

Library			Selenium2Library
Suite Teardown	Close Browser


*** Test Cases ***
Valid Login
    Open Browser to Login Page
    Enter Valid User Name
    Enter Valid Password
    Click Login
    Assert login
	[Teardown]	Close Browser
	
*** Keywords***
Open Browser To Login Page
	Open Browser					https://www.itaka.pl/	Firefox
	Maximize Browser Window
	Wait Until Element Is Visible	xpath://html/body/header/section/div/div[2]/ul/li[5]/a[1]/span
	Click Element					xpath://html/body/header/section/div/div[2]/ul/li[5]/a[1]/span
	Wait Until Element Is Visible	xpath://html/body/header/section/div/div[2]/ul/li[5]/div[1]/a
	Click Element					xpath://html/body/header/section/div/div[2]/ul/li[5]/div[1]/a
	Wait Until Page Contains Element	_username
	Title Should Be					Itaka.pl - Logowanie
	
Enter Valid User Name
    Input Text						_username			wsbjustyna@wp.pl

Enter Valid Password
    Input Text						_password			wsbcwicz2018

Click Login
	Click Element					xpath://html/body/div[2]/div/div/div[2]/div[1]/form/button

Assert Login
	Wait Until Page Contains		Witaj