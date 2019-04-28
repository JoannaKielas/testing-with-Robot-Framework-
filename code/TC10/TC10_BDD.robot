*** Settings ***
Documentation  Adding last minute trip to Greece
#and to Turkey to Ulubione
Resource  TC10_resources_KD_BDD.robot
Test Setup  Open Itaka.pl
Test Teardown  Close Itaka.pl

*** Variables ***
${BROWSER} =  ff
@{COUNTRIES} =  Grecja  Turcja
${Name of hotel to add}

*** Test Cases ***
Test Case Greece
    [Documentation]  Adding trip to Greece to Ulubione, BDD
#    [Tags]  Greece
    Given Page Last Minute on Itaka.pl is opened
    When "Rodzaj wyjazdu" is "Dowolne"
    And "Dokąd" is "Grecja"
    And "Szczegóły" button of the choosen trip is submited
    Then Add to "Ulubione" and check if it is in "Ulubione"

*** Keywords ***

Page Last Minute on Itaka.pl is opened
    Open "Last Minute"
"Rodzaj wyjazdu" is "Dowolne"
    Select "Rodzaj wyjazdu"
"Dokąd" is "Grecja"
    Select "Dokąd" Greece
"Szczegóły" button of the choosen trip is submited
    Select "Szczegóły"
Add to "Ulubione" and check if it is in "Ulubione"
    Add and check "Ulubione"

#Test Case 2 - Turkey
#    [Documentation]  Adding trip to Turkey to Ulubione
#    [Tags]  Turkey
#    Open "Last Minute"
#    Select "Rodzaj wyjazdu"
#    Select "Dokąd" Turkey
#    Select "Szczegóły"
#    Add to and check Ulubione