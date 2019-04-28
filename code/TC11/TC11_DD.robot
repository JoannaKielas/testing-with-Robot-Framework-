*** Settings ***
Documentation     A test suite containing tests related to searching trips.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Main Page
Suite Teardown    Close Browser
Test Setup        Select "Wycieczki"
Test Template     Enter different cities of departure
Resource          TC11_resources.robot

*** Test Cases ***    Place
First city            Warszawa
Second city           Częstochowa
Third city            Gliwice
Fourth city           Łódź
Fifth city            Leszno



*** Keywords ***
Enter different cities of departure
    [Arguments]    ${place}
    Select multiple "Skąd"   ${place}


Main Page Should Be Open
    Title Should Be    Biuro podróży ITAKA | Wakacje - wycieczki i wczasy zagraniczne


