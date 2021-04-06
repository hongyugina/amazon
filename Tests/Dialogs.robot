*** Settings ***
Documentation    These are some web tests
Library        Dialogs
Resource       ../Resources/Common.robot      
Resource       ../Resources/AmazonApp.robot  
Resource    ../Resources/AmazonApp.robot
Resource    ../Resources/AmazonApp.robot
Test Setup     Common.Begin Web Test
Test Teardown  Common.End Web Test   

# robot -d results/dialogs  tests/dialogs.robot


*** Variables ***
${BROWSER}        chrome
${START_URL}      https://www.amazon.com
${SEARCH_TERM}    Ferrari 458



*** Test Cases ***
Logged out user can search for products
    [Tags]     Web
    ${new_browser}    Get Selection From User    Which browser?     chrome  ie  firefox
    Set Global Variable    ${BROWSER}    ${new_browser}   
    AmazonApp.Search for Products


Logged out user can add product to cart
    [Tags]     Web
    AmazonApp.Search for Products
    Execute Manual Step    Please select a value!   It failed!
    AmazonApp.Select Product from Search Results
    Pause Execution
    AmazonApp.Add Product to Cart