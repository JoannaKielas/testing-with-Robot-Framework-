*** Settings ***
#robot -d results TC01_BDD.robot

Documentation    Registering account on itaka.pl. BDD method
Resource  TC01_resources_KD_BDD.robot

Test Teardown  Close Browser

*** Test Cases ***

Account registration with valid data
    Given user open Browser to Registration Page
    When user add name
    And user add surname
    And user add phone number
    And user add e-mail adress
    And user enter the password
    And user select the checkbox options
    And user click Registration Button
    Then registration was successful