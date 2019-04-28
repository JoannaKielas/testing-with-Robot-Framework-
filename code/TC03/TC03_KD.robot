*** Settings ***
#robot -d results TC03_KD.robot

Documentation    Registering account on itaka.pl. Keyword-driven method
Resource  TC03_resources_KD_BDD.robot

Test Setup  Open Browser to Registration Page
Test Teardown  Close Browser


*** Test Cases ***

Account registration with existing email address in system
    user add name
    user add surname
    user add phone number
    user add e-mail adress
    user enter the password
    user select the checkbox options
    user click Registration Button
    no registration - user used existing email
