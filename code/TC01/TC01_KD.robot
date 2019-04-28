*** Settings ***
#robot -d results TC01_KD.robot

Documentation    Registering account on itaka.pl. Keyword-driven method
Resource  TC01_resources_KD_BDD.robot

Test Setup  Open Browser to Registration Page
Test Teardown  Close Browser


*** Test Cases ***

Account registration with valid data
    user add name
    user add surname
    user add phone number
    user add e-mail adress
    user enter the password
    user select the checkbox options
    user click Registration Button
    registration was successful