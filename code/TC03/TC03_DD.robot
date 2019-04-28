*** Settings ***
#robot -d results TC03_DD.robot

Documentation    Registering account on itaka.pl. Data-driven method
Resource  TC03_resources_DD.robot


*** Variables ***
${EXISTING_EMAIL_PATH} =  ${EXECDIR}${/}\\TC03_variables_DD.csv

*** Test Cases ***

Account registration with existing email address in system
    ${RegistrationScenarios} =  Get CSV RegisterData  ${EXISTING_EMAIL_PATH}
    Register with Many Credentials  ${RegistrationScenarios}