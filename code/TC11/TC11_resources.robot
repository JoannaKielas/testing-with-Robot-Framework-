*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${MAIN URL}       https://www.itaka.pl/
${BROWSER}        Firefox
@{DEPARTURES}     Warszawa  Częstochowa  Gliwice  Łódź  Leszno
${place}


*** Keywords ***
Open Browser To Main Page
    Open Browser    ${MAIN URL}    ${BROWSER}
    Maximize Browser Window
    Main Page Should Be Open

Main Page Should Be Open
    Title Should Be    Biuro podróży ITAKA | Wakacje - wycieczki i wczasy zagraniczne

Select "Wycieczki"
    Click Element  css=.searchwell > form:nth-child(1) > div:nth-child(2) > label:nth-child(2) > span:nth-child(1)
    Sleep  3s


Select "Dokąd"
    Click Element  css=div.fRow:nth-child(9) > div:nth-child(3) > button:nth-child(1)
    Click Element  css=.destination-toggle
    Click Element  css=.destination-submit


Select "Skąd"
    #choose Warszawa
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Input Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)  @{DEPARTURES}[0]
    Sleep  2s
    Click Element  css=li.option-parent:nth-child(40)

    #choose Częstochowa
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Input Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)  @{DEPARTURES}[1]
    Sleep  2s
    Click Element  css=.jspPane > ul:nth-child(1) > li:nth-child(5) > label:nth-child(1)

    #choose Gliwice
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Input Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)  @{DEPARTURES}[2]
    Sleep  2s
    Click Element  css=.jspPane > ul:nth-child(1) > li:nth-child(8) > label:nth-child(1)

    #choose Lódź
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Input Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)  @{DEPARTURES}[3]
    Sleep  2s
    Click Element  css=.jspPane > ul:nth-child(1) > li:nth-child(21) > label:nth-child(1)

    #choose Leszno
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Input Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)  @{DEPARTURES}[4]
    Sleep  2s
    Click Element  css=.jspPane > ul:nth-child(1) > li:nth-child(18) > label:nth-child(1)

    Click Element  css=.plo > h1:nth-child(2)

Select multiple "Skąd"
    [Arguments]    ${place}
    Click Element  css=div.fRow:nth-child(10) > div:nth-child(3) > button:nth-child(1)
    Input Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)  ${place}
    Sleep  2s
    Clear Element Text  css=.open > div:nth-child(2) > div:nth-child(1) > input:nth-child(1)

Select "Osoby"
    Click Element  id=participants-count
    Click Element  id=adults-select
    Click Element  css=#adults-select > option:nth-child(4)
    Click Element  css=.plo > h1:nth-child(2)


Select "Szukaj"
    Click Element  css=.fBut > button:nth-child(1)
    Sleep  3s
    Title Should Be    Wyniki Wyszukiwania | ITAKA
    ${SORT_TRIP} =  Get Text   css=.filter-packageType > div:nth-child(2) > button:nth-child(1)
    Should Be Equal  ${SORT_TRIP}  Wycieczki objazdowe
    ${FROM} =  Get Text  css=.filter-departureRegion > div:nth-child(2) > button:nth-child(1) > span:nth-child(1)
    Should Be Equal  ${FROM}  5
    ${PERSONS} =  Get Text  css=.participants > button:nth-child(1)
    Should Be Equal  ${PERSONS}  4 dorosłych



