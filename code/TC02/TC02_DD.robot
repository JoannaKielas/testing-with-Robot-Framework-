*** Settings ***
#robot -d results TC02_DD.robot

Documentation    Registering account on itaka.pl. Data-driven method
Resource  TC02_resources_DD.robot


*** Variables ***
${EMPTY_EMAIL_PATH} =  ${EXECDIR}${/}\\TC02_variables_DD.csv

*** Test Cases ***

Account registration without email address
    ${RegistrationScenarios} =  Get CSV RegisterData  ${EMPTY_EMAIL_PATH}
    Register with Many Credentials  ${RegistrationScenarios}