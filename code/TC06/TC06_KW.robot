*** Settings ***
Documentation     A test invalid login.
...					Test data contains invalid password
...					(proper lenght passwords)


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource		TC06_resources_KW.robot


***Variables***
${username}	wsbjustyna@wp.pl
${password}	qwertyuio
${message_invalid}	Nieprawidłowe dane.


*** Test Cases ***
Login With Invalid Credentials Should Fail
    Input Username		${username}
    Input Password 		${password}
    Submit Credentials
    Text appears
	Close Browser