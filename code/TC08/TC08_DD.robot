*** Settings ***
Documentation     A test invalid login. 
...					Placed valid user  and no password


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With No Password Should Fail
Resource          TC08_resources_DD.robot
Resource		TC08_variables_DD.tsv

*** Test Cases ***               USER NAME        PASSWORD
No Password						${VALID USER}		${Empty}

*** Keywords ***
Login With No Password Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
	Location Should Be	${ERROR URL}
	Page Should Contain	@{message_empty_field}[0]