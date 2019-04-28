*** Settings ***
Documentation     A resource file with reusable keywords.
...
...               They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Resource		TC07_variables_DD.tsv


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Itaka.pl - Logowanie

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    _username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Element    xpath://html/body/div[2]/div/div/div[2]/div[1]/form/button

Text appears
	Page should Contain	${message_invalid}
