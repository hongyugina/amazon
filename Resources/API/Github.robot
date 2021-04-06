*** Settings ***
Library  RequestsLibrary
Library  SeleniumLibrary   # only used to display something we get back from API test


*** Variables ***


*** Keywords ***
Check Github Username
    # Create the Session
    Create Session  my_github_session  https://api.github.com  verify=True   #disable_warnings=1

    
    #  Make the call (and capture the response in a variable)
    ${response} =  Get On Session  my_github_session    users/robotframeworktutorial

    #  Check the Response status
    Should Be Equal As Strings    ${response.status_code}    200

    #  Check the Response body or payload
    ${json_data} =  Set Variable  ${response.json()}    # convert the response from string to Json format
    Should Be Equal As Strings    ${json_data['login']}    robotframeworktutorial
    Log  ${json_data}


Display emoji
    #  Create the session
    Create Session  my_github_session  https://api.github.com

    #  Make the call (and capture the response in a variable)
    ${response} =  Get Request  my_github_session  emojis

    #  Check the Response body
    ${json_data} =  Set Variable  ${response.json()}
    ${emoji_url} =  Set Variable  ${json_data['aerial_tramway']}
    Open Browser  ${emoji_url}  firefox
    # Close Browser




