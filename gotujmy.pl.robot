#*** Settings ***
#Library  SeleniumLibrary
#
#*** Variables ***
#@{emails}   email_1@pol.pl    email_2@pol.pl    email_3pol.pl    email_4@pol.pl     email_5@pol.pl
#@{passwords}    password_1     password_2     password_3     password_4     password_5
#${message}     Dziekujemy za zalozenie konta.
#*** Test Cases ***
*** Settings ***
Library  SeleniumLibrary
*** Test Cases ***
Registration In Forum
    *** Settings ***
Library  SeleniumLibrary
*** Test Cases ***
Register
    Open Browser  https://gotujmy.pl  chrome
    Maximize Browser Window
    BuiltIn.Run Keyword And Ignore Error  Click Button  //*[contains(text(),'Akceptuj')]
    BuiltIn.Run Keyword And Ignore Error  Click Element  //a[contains(text(),'Zarejestruj się')]
    Input Text    id:f_cmu_email    niematakiegomaila@gmail.com
    Input Text    id:f_cmu_email2    niematakiegomaila@gmail.com
    Input Text    id:f_cmu_password    12345
    Input Text    id:f_cmu_password2    12345
    Checkout Should Not Be Selected    id:newsletter_agree
    Select CheckBox    id:newsletter_agree
    Checkout Should Not Be Selected    //*[@id="user_register_form"]/fieldset/label[2]/input
    Select CheckBox    //*[@id="user_register_form"]/fieldset/label[2]/input
    Checkout Should Not Be Selected    //*[@id="user_register_form"]/fieldset/label[3]/input
    Select CheckBox    //*[@id="user_register_form"]/fieldset/label[3]/input
    Click Button    //*[@id="user_register_form"]/fieldset/footer/button
    Wait Until Element Is Visible     //*[@id="main_content"]/div/div/h1    timeout=5
    ${my_message}    Get Text     //*[@id="main_content"]/div/div/h1
    Log To Console     ${my_message}
    Should Be Equal As Strings    ${my_message}     ${message}
    Capture Page Screenshot     zrzut.png

#*** Test Cases ***
#Registration Of Multiple User
#    FOR    ${i}    IN RANGE    5
#        Registration In Forum    ${emails}[${i}]     ${passwords}[${i}]
#        Log     User ${emails}[${i}]
#    END