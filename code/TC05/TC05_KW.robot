*** Settings ***
Documentation     A test invalid login.
...					Test data invalid user with valid password.


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource		TC05_resources_KW.robot

***Variables***
${username}	awrs@wp.pl
${password}	wsbcwicz2018
${message_invalid}	Nieprawidłowe dane.

*** Test Cases ***
Login With Invalid Credentials Should Fail
    Input Username		${username}
    Input Password		${password}
    Submit Credentials
    Text appears	${message_invalid}
	Close Browser