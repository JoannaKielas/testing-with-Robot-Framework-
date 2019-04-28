*** Settings ***
Documentation     A resource file with reusable keywords.
...
...               They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library


*** Keywords ***
Open Browser To Login Page
    Open Browser    https://user.itaka.pl/    Firefox
    Maximize Browser Window
    Set Selenium Speed    2
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Itaka.pl - Logowanie

Input Username
    [Arguments]    ${username}
    Input Text    _username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Element    xpath://html/body/div[2]/div/div/div[2]/div[1]/form/button

Text appears
	[Arguments]    ${message_invalid}
	Page should Contain	${message_invalid}