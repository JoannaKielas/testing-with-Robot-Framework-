*** Settings ***
Documentation     A test invalid login using loop.
...					Test data contains invalid password
...					(proper lenght passwords -{LONGPWDPWD})

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Resource		TC06_resources_KW.robot
Resource		TC06_variables_KW.tsv

*** Test Cases ***

Login with invalid password shoul fail
    @{ITEMS}    Create List	@{LONGPWD}
    :FOR    ${ELEMENT}    IN    @{ITEMS}
    \	Input Password	${ELEMENT}
	\	Input Username	${VALID USER}
	\	Submit Credentials
	\	Page should Contain	@{message_invalid_pwd}[1]