*** Settings ***
Test Setup      Open_Every_Time
Test Teardown    Close Browser
Library  SeleniumLibrary
*** Variables ***
${wikipedia_name}    RobotTest
${wikipedia_password}     RobotFramework
${error_message}    Podany login lub haslo sa nieprawidlowe. Sprobuj jeszcze raz.
*** Keywords ***
Open Every_Time
    Open Browser    http://pl.wikipedia.org    Chrome

Log in Wikipedia
    [Arguments]    ${Login}    ${Password}
    Click Element    id:pt-login
    Input Text    id:wpName1    ${wikipedia_name}
    Input Password    id:wpPassword1    ${wikipedia_password}
    Checkbox Should Not Be Selected    id:wpRemember
    Select Checkbox     id:wpRemember
    Click Button    id:wpLoginAttempt

*** Test Cases ***
Test_1
    Log in Wikipedia     ${wikipedia_name}     ${wikipedia_password}
    Input Text    id:searchInput    Wroclaw
    Click Button    id:searchButton
    Sleep    2
    Capture Page Screenshot    screen.png

Fail_Test
    Log in Wikipedia     ${wikipedia_name}     12345
    BuiltIn.Sleep    15
    Wait Until Element Is Visible    css:.mw-message-box-error    timeout=5
    ${my_error_message}    Get Text    css:.mw-message-box-error
    Log    ${my_error_message}
    Log To Console    ${my_error_message}
    Capture Page Screenshot     proba.png
    Should Be Equal As Strings    ${error_message}    ${my_error_message}

