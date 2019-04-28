*** Settings ***
#robot -d results TC02_KD.robot

Documentation    Registering account on itaka.pl. Keyword-driven method
Resource  TC02_resources_KD_BDD.robot

Test Setup  Open Browser to Registration Page
Test Teardown  Close Browser


*** Test Cases ***

Account registration without email address
    user add name
    user add surname
    user add phone number
    user enter the password
    user select the checkbox options
    user click Registration Button
    no registration - user forgot enter mail address