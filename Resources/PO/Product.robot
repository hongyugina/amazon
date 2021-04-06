*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${PRODUCT_ADDTOCART_BUTTON}    css:#add-to-cart-button

*** Keywords ***
Verify Page Loaded
    wait until page contains   Back to results

Add to Cart
    Click Button    ${PRODUCT_ADDTOCART_BUTTON}

