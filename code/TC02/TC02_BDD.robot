*** Settings ***
#robot -d results TC02_BDD.robot

Documentation    Registering account on itaka.pl. BDD method
Resource  TC02_resources_KD_BDD.robot

Test Teardown  Close Browser

*** Test Cases ***

Account registration without email address
    Given user open Browser to Registration Page
    When user add name
    And user add surname
    And user add phone number
    And user enter the password
    And user select the checkbox options
    And user click Registration Button
    Then no registration - user forgot enter mail address