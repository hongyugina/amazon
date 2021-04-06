*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CART_PROCEEDTOCHECK_LINK}    id:hlb-ptc-btn-native
*** Keywords ***

Verify Product Added
    wait until page contains    Added to Cart

Proceed to Checkout
    Click Link      ${CART_PROCEEDTOCHECK_LINK}
