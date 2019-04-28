*** Settings ***
Documentation     A test invalid login. 
...					Placed valid user  and no password


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource		TC08_resources_DD.robot


***Variables***
${username}	wsbjustyna@wp.pl
${password}
${message_invalid}	Pole jest wymagane.

*** Test Cases ***
Login With No Password Should Fail
    Input Username		${username}
    Input Password 		${password}
    Submit Credentials
    Text appears
	Close Browser