*** Settings ***

Resource    ./PO/LandingPage.robot
Resource    ./PO/TopNav.robot
Resource    ./PO/SearchResults.robot
Resource    ./PO/Product.robot
Resource    ./PO/Cart.robot
Resource    ./PO/SignIn.robot
Resource    PO/SignIn.robot





*** Keywords ***
Login
    [Arguments]    ${Username}  ${Password} 
    SignIn.Login With Valid Credentials     ${Username}  ${Password} 

Login with Invalid Credentials
    SignIn.Fill "Email" Field       bogus@bogus.com 
    SignIn.Click "Continue" Button
    SignIn.Fill "Password" Field    badpassword
    SignIn.Click "Sign-In" Button
    SignIn.Verify "Sign in" Failure
   

Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for Products
    SearchResults.Verify Search Completed

Verify Results Page Contains Products
    [Arguments]    ${ExpectedProductCount}
    SearchResults.Verify Product Count  ${ExpectedProductCount} 

Select Product from Search Results
    SearchResults.Click Product Link
    Product.Verify Page Loaded

Add Product to Cart
      Product.Add to Cart
      Cart.Verify Product Added


Begin Checkout
    Cart.Proceed to Checkout
    SignIn.Verify Page Loaded

