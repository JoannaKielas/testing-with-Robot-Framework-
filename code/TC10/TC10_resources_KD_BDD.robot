*** Settings ***
Documentation    Add last minute trip to Greece and to Turkey to Ulubione
Library  Selenium2Library

*** Keywords ***

Open Itaka.pl
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  http://itaka.pl
    Wait Until Page Contains  Biuro Podróży ITAKA

Open "Last Minute"
    Click Link  partial link:Minute
    Wait Until Page Contains  Last Minute - wczasy, wycieczki, oferty wakacji
    Log  Last Minute is opened

Select "Rodzaj wyjazdu"
    Click Element  css=.filter-packageType > div:nth-child(2) > button:nth-child(1)
    Click Element  css=.filter-packageType > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1)

    Log  Rodzaj wyjazdu is Dowolne

Select "Dokąd" Greece
    Click Element  css=.dest-region > button:nth-child(1)
    Input Text  css=.dest-region_search  @{COUNTRIES}[0]
    Click Element  css=.popular-list_content > div:nth-child(1) > span:nth-child(1)
    Click Element  css=.action-panel_choose-button
    Wait Until Page Contains  @{COUNTRIES}[0]

Select "Dokąd" Turkey
    Click Element  css=.dest-region > button:nth-child(1)
    Input Text  css=.dest-region_search  @{COUNTRIES}[1]
    Click Element  css=.popular-list_content > div:nth-child(1) > span:nth-child(1)
    Click Element  css=.action-panel_choose-button
    Wait Until Page Contains  @{COUNTRIES}[1]

Select "Dokąd"
    [Arguments]  ${COUNTRY}
    Click Element  css=.dest-region > button:nth-child(1)
    Input Text  css=.dest-region_search  ${COUNTRY}
    Click Element  css=.popular-list_content > div:nth-child(1) > span:nth-child(1)
    Click Element  css=.action-panel_choose-button
    Wait Until Page Contains  ${COUNTRY}

Select "Szczegóły"
    ${Tytuł} =  Get Title
    Wait Until Page Contains  Szczegóły
    Click Link  Szczegóły
    Wait Until Keyword Succeeds  5  1  Select Window  new

Add and check "Ulubione"

    Set Selenium Timeout  15s
    Wait Until Page Contains  Zaloguj
    Wait Until Keyword Succeeds  5  1  Get Text  css=.path > h1:nth-child(11)
    ${Name of trip to add} =  Get Text  css=.path > h1:nth-child(11)
    Wait Until Page Contains  Ostatnie miejsca
    Wait Until Page Contains  Zapytaj o ofertę
#    Wait Until Page Contains  Aktualna pogoda
    Element Should Be Enabled  css=.add_to_clipboard
    Click Element  css=.add_to_clipboard
    Element Should Be Enabled  css=.clipboard-add
    Click Element  css=.clipboard-add

    Wait Until Element Contains  css=.mh-clipboard-counter  1
    Log  Ulubione=1!
    Click Element  css=.mh-clipboard > a:nth-child(1)
    Wait Until Element is Visible  css=.blue > a:nth-child(1)
    Click Element  css=.blue > a:nth-child(1)
    Wait Until Element is Visible  css=h1:nth-child(11)

    ${Trip added} =  Get Text  css=h1:nth-child(11)

    Log  ${Name of trip to add}
    Should Be Equal  ${Name of trip to add}  ${Trip added}


Close Itaka.pl
    Close Browser