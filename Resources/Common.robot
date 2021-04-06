*** Settings ***
Library    SeleniumLibrary

*** Variables ***



*** Keywords ***
Begin Web Test
    #[Arguments]  ${browser}
    open browser    about:blank  ${BROWSER}   # headlessfirefox to run test in headless mode
    MAXIMIZE BROWSER WINDOW
    #open browser    about:blank    ${browser}

End Web Test
    Close All Browsers
