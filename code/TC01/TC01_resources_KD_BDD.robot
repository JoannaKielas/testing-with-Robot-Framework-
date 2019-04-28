*** Settings ***
Documentation    Registering account on itaka.pl
Library  Selenium2Library

*** Variables ***
${Browser}  ff
${SiteUrl}  https://user.itaka.pl/pl/register/


*** Keywords ***

Open Browser to Registration Page
    Open Browser  about:blank  ${Browser}
    Maximize Browser Window
    Go to  ${SiteUrl}
    Wait Until Page Contains  Chcę założyć konto

#repeated for the needs of BDD method
user open Browser to Registration Page
    Open Browser  about:blank  ${Browser}
    Maximize Browser Window
    Go to  ${SiteUrl}
    Wait Until Page Contains  Chcę założyć konto

Close Browser
    Close all Browsers

user add name
    Input Text  id=fos_user_registration_form_name  Marianna

user add surname
    Input Text  id=fos_user_registration_form_surname  Malinowska

user add phone number
    Input Text  id=fos_user_registration_form_phone  545672371

user add e-mail adress
    Input Text  id=fos_user_registration_form_email  testerka2018@test.pl

user enter the password
    Input Password  id=fos_user_registration_form_plainPassword  tester2018

user select the checkbox options
    Click Element  xpath=//*[@id="register-form"]/div[7]/div/label/strong

user click Registration Button
    Click Button  id=fos_user_registration_form_submit

registration was successful
    Wait Until Page Contains  Rejestracja przebiegła pomyślnie