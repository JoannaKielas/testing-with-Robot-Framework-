*** Settings ***
#robot -d results TC01_DD.robot

Documentation    Registering account on itaka.pl. Data-driven method
Resource  TC01_resources_DD.robot

*** Variables ***
${VALID_DATA_PATH} =  ${EXECDIR}${/}\\TC01_variables_DD.csv

*** Test Cases ***

Account registration with valid data
    ${RegistrationScenarios} =  Get CSV RegisterData  ${VALID_DATA_PATH}
    Register with Many Credentials  ${RegistrationScenarios}

