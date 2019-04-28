*** Settings ***
Documentation    Registering account on itaka.pl. Data-driven method
Library  Selenium2Library
Library  TC01_import_csv.py

*** Variables ***
${BROWSER}  ff
${SiteURL}  https://user.itaka.pl/pl/register/

${REGISTER_IN_NAME} =           xpath=//*[@id="fos_user_registration_form_name"]
${REGISTER_IN_SURNAME} =        xpath=//*[@id="fos_user_registration_form_surname"]
${REGISTER_IN_PHONENUMBER} =    xpath=//*[@id="fos_user_registration_form_phone"]
${REGISTER_IN_EMAIL} =          xpath=//*[@id="fos_user_registration_form_email"]
${REGISTER_IN_PASSWORD} =       xpath=//*[@id="fos_user_registration_form_plainPassword"]
${REGISTER_IN_CHECKBOX}=       xpath=//*[@id="register-form"]/div[7]/div/label/strong
${REGISTER_SUBMIT_BUTTON} =     xpath=//*[@id="fos_user_registration_form_submit"]


*** Keywords ***
Begin Web Test

    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  ${SiteURL}
    Wait Until Page Contains  Chcę założyć konto

End Web Test
    Close All Browsers

Get CSV RegisterData
    [Arguments]  ${FilePath}
    ${RegisterData} =  read csv file  ${FilePath}
    [Return]  ${RegisterData}

Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials[0]}' == '#BLANK'  Input Text  ${REGISTER_IN_NAME}  ${Credentials[0]}
    run keyword unless  '${Credentials[1]}' == '#BLANK'  Input Text  ${REGISTER_IN_SURNAME}  ${Credentials[1]}
    run keyword unless  '${Credentials[2]}' == '#BLANK'  Input Text  ${REGISTER_IN_PHONENUMBER}  ${Credentials[2]}
    run keyword unless  '${Credentials[3]}' == '#BLANK'  Input Text  ${REGISTER_IN_EMAIL}  ${Credentials[3]}
    run keyword unless  '${Credentials[4]}' == '#BLANK'  Input Text  ${REGISTER_IN_PASSWORD}  ${Credentials[4]}

Check Options
    Click Element  ${REGISTER_IN_CHECKBOX}

Click Submit
    Click Button  ${REGISTER_SUBMIT_BUTTON}

Verify Message
    [Arguments]  ${ExpectedMessage}
    Page Should Contain  ${ExpectedMessage[5]}



#Keywords for test
Register with Many Credentials
    [Arguments]  ${RegistrationScenarios}
    :FOR  ${RegistrationScenario}  IN  @{RegistrationScenarios}
    \  run keyword and continue on failure  Begin Web Test
    \  run keyword and continue on failure  Attempt Register  ${RegistrationScenario}
    \  run keyword and continue on failure  Verify Register Page Message  ${RegistrationScenario}
    \  run keyword and continue on failure  End Web Test


Attempt Register
    [Arguments]  ${Credentials}
    Enter Credentials  ${Credentials}
    Check Options
    Click Submit


Verify Register Page Message
    [Arguments]  ${ExpectedMessage}
    Verify Message  ${ExpectedMessage}
