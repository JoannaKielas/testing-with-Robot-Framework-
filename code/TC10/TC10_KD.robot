*** Settings ***
Documentation  Add last minute trip to Greece and to Turkey to Ulubione
Resource  TC10_resources_KD_BDD.robot
Test Setup  Open Itaka.pl
Test Teardown  Close Itaka.pl

*** Variables ***
${BROWSER} =  ff
@{COUNTRIES} =  Grecja  Turcja
${Name of hotel to add}

*** Test Cases ***
Test Case 1 - Greece
    [Documentation]  Adding trip to Greece to Ulubione
    [Tags]  Greece
    Open "Last Minute"
    Select "Rodzaj wyjazdu"
    Select "Dokąd" Greece
    Select "Szczegóły"
    Add and check "Ulubione"

Test Case 2 - Turkey
    [Documentation]  Adding trip to Turkey to Ulubione
    [Tags]  Turkey
    Open "Last Minute"
    Select "Rodzaj wyjazdu"
    Select "Dokąd" Turkey
    Select "Szczegóły"
    Add and check "Ulubione"