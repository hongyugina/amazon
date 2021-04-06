*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${SIGNIN_MAIN_HEADING}    xpath: //*[@id="authportal-main-section"]/div[2]/div/div[1]/form/div/div/div/h1 
${SIGNIN_MAIN_HEADING}      xpath: //h1 
${SIGNIN_EMAIL}             id: ap_email 
${SIGNIN_CONTINUE_BUTTON}   id: continue 
${SIGNIN_PASSWORD}          id: ap_password
${SIGNIN_SIGN_IN_BUTTON}    id: signInSubmit  
${SIGNIN_FAILURE}           css: #auth-warning-message-box > div > div > ul > li > span

*** Keywords ***

Verify Page Loaded
   # Page Should Contain Element  id: ap_email            
   # Element Text Should Be   id: continue    Continue

   Page Should Contain Element   ${SIGNIN_MAIN_HEADING}
   Element Text Should Be        ${SIGNIN_MAIN_HEADING}   Sign-In

           
Login With Valid Credentials
    [Arguments]    ${Username}  ${Password}
    Fill "Email" Field    ${Username}      
    Click "Continue" Button
    Fill "Password" Field  ${Password}
    Click "Sign-In" Button
    Verify "Sign in" Failure

Fill "Email" Field
    [Arguments]    ${Username} 
    Input Text   ${SIGNIN_EMAIL}   ${Username} 
   # Log    Filling "Email" field with    ${Username}  

Click "Continue" Button
    Click Button    ${SIGNIN_CONTINUE_BUTTON}
   # Log    Clicking "Continue" Button        
   
Fill "Password" Field
    [Arguments]    ${Password} 
    Input Text     ${SIGNIN_PASSWORD}   ${Password}     
  # Log    Filling "Email" field with    ${Password}  

Click "Sign-In" Button
    Click Button    ${SIGNIN_SIGN_IN_BUTTON}
  #  Log    Clicking "Sign-In" Button

Verify "Sign in" Failure
    Element Text Should Not Be  ${SIGNIN_FAILURE}   To better protect your account, please re-enter your password and then enter the characters as they are shown in the image below.
             
