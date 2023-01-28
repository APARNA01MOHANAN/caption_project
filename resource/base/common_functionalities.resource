*** Settings ***
Documentation   This resource file contains browser configuration
...     and reusable scripts

Library  SeleniumLibrary

*** Variables ***

${BROWSER_NAME}   chrome
${URL}  https://www.chumbak.com/


*** Keywords ***

Launch Browser And Navigate To Url
    Open Browser  browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait   30s
    Go To    url=${URL}

Capture Screenshot And Close Browser
    Run Keyword And Ignore Error   Capture Page Screenshot
    Close Browser