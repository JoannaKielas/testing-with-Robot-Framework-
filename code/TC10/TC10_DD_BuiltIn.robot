*** Settings ***
Documentation  Add last minute trip to Greece and to Turkey to Ulubione
Resource  TC10_resources_DD.robot
#Test Setup  Open Itaka.pl
#Test Teardown  Close Itaka.pl

*** Variables ***

${BROWSER} =  ff
@{COUNTRIES} =  Grecja  Turcja
${Name of hotel to add}

*** Test Cases ***

Add trip to the countries from the list COUNTRIES to "Ulubione" - BuiltIn
    [Template]  Add trip to selected country to "Ulubione" BuiltIn
    :FOR  ${COUNTRY}  IN  @{COUNTRIES}
    \  ${COUNTRY}
