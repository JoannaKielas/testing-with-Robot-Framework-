*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               search_trip_kd_pass.robot file.
Resource          TC11_resources.robot
Test Teardown     Close Browser

*** Test Cases ***
Search trip
    Given Browser is opened to main page
    When Checkbox "Wycieczki" is choosen
    And "Skąd" are Warszawa Częstochowa Gliwice Łódź Leszno
    And From list "Dokąd" all options are choosen
    And "Osoby" are 4 persons choosen
    And "Szukaj" is submitted
    Then Title should be Wyniki Wyszukiwania | ITAKA




*** Keywords ***
Browser is opened to main page
    Open Browser To Main Page

Checkbox "Wycieczki" is choosen
    Select "Wycieczki"

"Skąd" are Warszawa Częstochowa Gliwice Łódź Leszno
    Select "Skąd"

From list "Dokąd" all options are choosen
    Select "Dokąd"

"Osoby" are 4 persons choosen
    Select "Osoby"

"Szukaj" is submitted
    Select "Szukaj"

Title should be Wyniki Wyszukiwania | ITAKA
    Title should be    Wyniki Wyszukiwania | ITAKA


