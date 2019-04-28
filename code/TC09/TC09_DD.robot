*** Settings ***
Documentation     A test invalid login. 
...					Placed valid password and no user


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login Without User Should Fail
Resource          TC09_resources_DD.robot
Resource		TC09_variables_DD.tsv

*** Test Cases ***               USER NAME        PASSWORD
No User						${Empty}		${VALID PASSWORD}

*** Keywords ***
Login Without User Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
	Location Should Be	${ERROR URL}
	Page Should Contain	@{message_empty_field}[0]