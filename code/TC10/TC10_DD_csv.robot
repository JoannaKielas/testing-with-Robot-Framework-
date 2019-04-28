*** Settings ***
Documentation  Add last minute trip to Greece and to Turkey to Ulubione
Resource  TC10_resources_DD.robot

*** Variables ***
${BROWSER} =  ff
${PATH_TO COUNTRIES_CSV} =  ${EXECDIR}${/}\\TC10_variables_DD.csv

*** Test Cases ***
Add trip to the Countries from the file Countries.csv to "Ulubione"
    @{COUNTRIES_CSV} =  Get Country Name From CSV File  ${PATH_TO COUNTRIES_CSV}
    Add trip to selected country to "Ulubione" CSV  @{COUNTRIES_CSV}

