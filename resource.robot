*** Settings ***
Library           SeleniumLibrary
Library           ExampleLib.py

*** Variables ***
${url}            https://en.wikipedia.org
${opensoure}      https://demo.nopcommerce.com
${email_txt}      id:Email
${checkbox}       http://www.practiceselenium.com/practice-form.html
${default_page}    http://www.google.com

*** Keywords ***
Seach
    [Arguments]    ${text}
    Open Browser    ${url}
    Input Text    id: searchInput    ${text}
    Click Element    //*[@id="searchform"]/button
    Sleep    3
    Close All Browsers

Login and check box
    Go To ${opensoure}
    Maximize Browser window
    Title Should Be    nopCommerce demo store
    click link    //a[@class='ico-login']
    Element Should Be Visible    ${email_txt}
    Element Should Be Enabled    ${email_txt}
    #input email
    Input Text    ${email_txt}    Truong@gmail.com
    Sleep    5
    Clear Element Text    ${email_txt}
    Sleep    3
    #check the checkbox
    Select Checkbox    RememberMe
    Sleep    3

test teardown
    Log    This is the cleanup step    console=yes
    Sleep    3
    Close All Browsers

test setup
    [Arguments]    ${url}
    Open Browser    ${url}
    Location Should Contain    ${url}
    Maximize Browser window
