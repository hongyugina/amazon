*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${SEARCHRESULTS_SELECT_PRODUCT}    css: #search > div.s-desktop-width-max.s-opposite-dir > div > div.s-matching-dir.sg-col-16-of-20.sg-col.sg-col-8-of-12.sg-col-12-of-16 > div > span:nth-child(4) > div.s-main-slot.s-result-list.s-search-results.sg-row > div:nth-child(9) > div > span > div > div > div:nth-child(3) > h2 > a

*** Keywords ***
Verify Search Completed
   Wait until page contains    results for "${SEARCH_TERM}"
   # Page Should Contain  ${SEARCH_TERM}


Verify Product Count
    [Arguments]  ${ExpectedProductCount}
   #  xpath should match x times  //li[contains(@id, "result_")]  ${ExpectedProductCount}
   Page Should Contain Element  //div[contains(@data-cel-widget,'search_result_')]  ${ExpectedProductCount}


Click Product Link
    [Documentation]  Clicks on the first product in the search results list
   # click link    link: 1/14 Scale Ferrari 458 Speciale A Radio Remote Control Model Car R/C RTR Auto Open & Close Roof Convertible Push Button
   # Click Image    ${SEARCHRESULTS_SELECT_PRODUCT}
    Click Element    ${SEARCHRESULTS_SELECT_PRODUCT}
