*** Settings ***
Documentation     A test invalid login. 
...					When someone tries to login without data


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login Without Credentials Should Fail
Resource          TC07_resources_DD.robot
Resource		TC07_variables_DD.tsv

*** Test Cases ***                     USER NAME        PASSWORD
Login Without Credentials Should Fail	${Empty}		${Empty}

*** Keywords ***
Login Without Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
	Location Should Be	${ERROR URL}
	Page Should Contain	@{message_empty_field}[0]