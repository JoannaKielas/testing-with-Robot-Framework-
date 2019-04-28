*** Settings ***
Documentation     A test suite with a single test for search trip.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource          TC11_resources.robot



*** Test Cases ***
Search Trip
    Open Browser To Main Page
    Select "Wycieczki"
    Select "Skąd"
    Select "Dokąd"
    Select "Osoby"
    Select "Szukaj"
    [Teardown]    Close Browser

    
    