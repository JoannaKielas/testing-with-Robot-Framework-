*** Settings ***
Documentation     A test invalid login.
...					Test data invalid user with valid password
...					and invalid user and password)


Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          TC05_resources_DD.robot
Resource		TC05_variables_DD.tsv

*** Test Cases ***               USER NAME        PASSWORD
Invalid User		@{INVALID USER}[2]	${VALID PASSWORD}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
	Location Should Be	${ERROR URL}
	Page Should Contain	@{message_invalid_user}[0]