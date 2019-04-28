*** Settings ***
Documentation     A test invalid login. 
...					Placed valid user  and no password


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Resource		TC09_resources_DD.robot


***Variables***
${username}
${password}	wsbcwicz2018

*** Test Cases ***
Login With Invalid Credentials Should Fail
    Input Username		${username}
    Input Password 		${password}
    Submit Credentials
    Text appears
	Close Browser