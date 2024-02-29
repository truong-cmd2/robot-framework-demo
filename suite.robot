*** Settings ***
Suite Setup       Log To Console    Opening browser
Suite Teardown    Log To Console    Closing browser
Test Setup        test setup    ${default_page}
Test Teardown     test teardown
Library           SeleniumLibrary
Library           ExampleLib.py

*** Variables ***
${url}            https://en.wikipedia.org
${opensoure}      https://demo.nopcommerce.com
${email_txt}      id:Email
${checkbox}       http://www.practiceselenium.com/practice-form.html
${default_page}    http://www.google.com

*** Test Cases ***
seach form
    Go To    https://en.wikipedia.org
    Maximize Browser window
    Input Text    id: searchInput    Robot Framework
    Click Element    //*[@id="searchform"]/button

test library
    someaction

seach with argument
    [Tags]    reg1
    Seach    CBR1000RR-R

login
    Login and check box

check radio boxes
    Go To    ${opensoure}
    Maximize Browser window
    Set Selenium Speed    2seconds
    Select Radio Button    pollanswers-1    3
    Sleep    3

dropdown
    [Tags]    reg1
    Go To    ${opensoure}
    Maximize Browser window
    Set Selenium Speed    2seconds
    Select From List By Label    customerCurrency    Euro
    Sleep    3
    Mouse Over    //*[@class="top-menu notmobile"]//*[@href="/electronics"]
    Set Selenium Implicit Wait    10
    Click Element    //*[@href="/camera-photo"]
    Sleep    3
    Capture Element Screenshot    //*[@class="item-grid"]//child::div[@class="product-item"][@data-productid="13"]//child::div[@class='picture']

*** Keywords ***
Seach
    [Arguments]    ${text}
    Go To    ${url}
    Input Text    id: searchInput    ${text}
    Click Element    //*[@id="searchform"]/button

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
    Maximize Browser window
