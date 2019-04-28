*** Settings ***
Documentation    Add last minute trip to Greece and to Turkey to Ulubione
Library  Selenium2Library
Library  TC10_import_csv.py

*** Keywords ***
Get Country Name From CSV File
    [Arguments]  ${FilePath}
    @{Data} =  read_csv_file  ${FilePath}
    [Return]  ${Data}
    Log  ${Data}

Add trip to selected country to "Ulubione" CSV
    [Arguments]  @{COUNTRIES_CSV}
    :FOR  ${COUNTRYk}  IN  @{COUNTRIES_CSV}
    \  Open Itaka.pl
    \  Log  ${COUNTRYk}
    \  Log  ${COUNTRIES_CSV}
    \  Open "Last Minute"
    \  Select "Rodzaj wyjazdu"
    \  Select "Dokąd"  ${COUNTRYk}
    \  Select "Szczegóły"
    \  Add and check "Ulubione"
    \  Close Itaka.pl

Add trip to selected country to "Ulubione" BuiltIn
    [Arguments]  ${COUNTRY}
    Open Itaka.pl
    Open "Last Minute"
    Select "Rodzaj wyjazdu"
    Select "Dokąd"  ${COUNTRY}
    Select "Szczegóły"
    Add and check "Ulubione"
    Close Itaka.pl

Open Itaka.pl
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  http://itaka.pl
    Wait Until Page Contains  Biuro Podróży ITAKA

Open "Last Minute"
    Click Element  css=.menu-last > a:nth-child(1)
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
#    Wait Until Element is Enabled  css=.offer-list_inner-wrapper > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > article:nth-child(1) > div:nth-child(2) > div:nth-child(2) > a:nth-child(3) > span:nth-child(1)
#    Click Element  css=.offer-list_inner-wrapper > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > article:nth-child(1) > div:nth-child(2) > div:nth-child(2) > a:nth-child(3) > span:nth-child(1)
    Click Link  Szczegóły
    Wait Until Keyword Succeeds  5  1  Select Window  new

Add and check "Ulubione"
#    Sleep  1s
#    Select Window  new
    Set Selenium Timeout  20s
    Wait Until Page Contains  Zaloguj się
    Wait Until Element is Visible  css=.user-panel-trigger > span:nth-child(1)

    ${Name of trip to add} =  Get Text  css=.path > h1:nth-child(11)
#    Wait Until Element is Visible  css=.add_to_clipboard
    Wait Until Page Contains  Ostatnie miejsca
    Wait Until Page Contains  Zapytaj o ofertę
#    Wait Until Page Contains  Aktualna pogoda
    Wait Until Keyword Succeeds  5  1  Click Element  css=.add_to_clipboard
#    Click Element  css=.add_to_clipboard
    Wait Until Element is Visible  css=.clipboard-add
    Click Element  css=.clipboard-add
    Wait Until Element Contains  css=.mh-clipboard-counter  1
    Log  Ulubione=1!
    Click Element  css=.mh-clipboard > a:nth-child(1)
    Wait Until Element is Visible  css=.blue > a:nth-child(1)
    Click Element  css=.blue > a:nth-child(1)
    Wait Until Element is Visible  css=h1:nth-child(11)

    ${Trip added} =  Get Text  css=h1:nth-child(11)
    Sleep  1s
# "Sleep 1s" is used only to see the name of the hotel during executing test
    Log  ${Name of trip to add}
    Should Be Equal  ${Name of trip to add}  ${Trip added}

Close Itaka.pl
    Close Browser