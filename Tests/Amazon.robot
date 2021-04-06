*** Settings ***
Documentation    This is some basic info about the whole suites
Resource    ../Resources/AmazonApp.robot
Resource    ../Resources/Common.robot
Test Setup    Common.Begin Web Test
Test Teardown    Common.End Web Test

# robot -d results -i smoke tests/amazon.robot

*** Variables ***
${BROWSER}            gc
${START_URL}          https://www.amazon.com
${SEARCH TERM}        ferrari 458    #Lamborghini Gallardo 
${LOGIN_EMAIL}        hongyugina@hotmail.com
${LOGIN_PASSWORD}     gdunagan


*** Test Cases ***
Logged out User should be able to search for products
    [Documentation]    This is some basic info about the test
   #  [Tags]    Smoke           
    AmazonApp.Search for Products

Search results page should contain 64 products
    [Tags]    Smoke
    AmazonApp.Search for Products
    AmazonApp.Verify Results Page Contains Products  64

Logged out user should be able to view a product
    # [Tags]    Smoke
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results

Logged out User should be able to add product to cart
    [Documentation]    This is some basic info about the test
    #[Tags]    Smoke    
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart

User should be able to Login
    # [Tags]    Smoke
    AmazonApp.Login    ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}

Logged out user must sign in to check out
#    [Tags]  Smoke
   #Common.Begin Web Test  firefox   
   AmazonApp.Search for Products
   AmazonApp.Select Product from Search Results
   AmazonApp.Add Product to Cart
   AmazonApp.Begin Checkout
   #AmazonApp.Login    ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}
   AmazonApp.Login with Invalid Credentials
