*** Settings ***
Documentation     A test invalid login. 
...					When someone tries to login without data


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource		TC07_resources_DD.robot

***Variables***
${username}
${password}
${message_invalid}	Pole jest wymagane.

*** Test Cases ***
Login Without Credentials Should Fail
    Input Username		${username}
    Input Password		${password}
    Submit Credentials
    Text appears
	Close Browser