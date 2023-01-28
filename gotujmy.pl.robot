*** Settings ***
Library  SeleniumLibrary
*** Variables ***
@{emails}   email_1    email_2     email_3    email_4     email_5
@{passwords}    password_1     password_2     password_3     password_4     password_5
*** Test Cases ***
Registration In Forum
    Open Browser    http://gotujmy.pl/forum/    Chrome
    Run Keyword And Ignore Error    click button   //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    Click Element   //*[@id="navTop"]/nav/ul[1]/li[2]/a
    Run Keyword And Ignore Error    click button   //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    Input Text    id:f_cmu_email    niematakiegomaila@gmail.com
    Input Text    id:f_cmu_email2    niematakiegomaila@gmail.com
    Input Text    id:f_cmu_password    12345
    Input Text    id:f_cmu_password2    12345
    Select CheckBox    id:newsletter_agree
    Select CheckBox    //*[@id="user_register_form"]/fieldset/label[2]/input
    Select CheckBox    //*[@id="user_register_form"]/fieldset/label[3]/input
    Click Button    //*[@id="user_register_form"]/fieldset/footer/button
    Capture Page Screenshot