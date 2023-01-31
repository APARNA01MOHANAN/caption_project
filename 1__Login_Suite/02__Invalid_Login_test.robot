*** Settings ***
Documentation  This file contains test cases related to Invalid login
...  re-run the script in case of any failure

Resource    ../resource/base/common_functionalities.resource


Library  DataDriver  file=../test_input_data/CHUMBAK_DATA.xlsx  sheet_name=Invalid_Login_Test
Test Setup  Launch Browser And Navigate To Url
Test Teardown  Close Browser

Test Template  Invalid Login Template

*** Test Cases ***
Invalid Login Testcase_${test_case}

*** Keywords ***
Invalid Login Template
    [Arguments]   ${mailid}  ${password}  ${expected_error}
    Click Element   id=user_6_
    Click Element   link=Login
    Input Text   name=customer[email]    ${mailid}
    Input Text   name=customer[password]    ${password}
    Click Element   xpath=//button[text()='Login']
    #it may fail while excecuting next line as it may stay still on login page so re-run incase of failure
    Element Should Contain   xpath=//p[contains(text(),'Incorrect email')]    ${expected_error}
    sleep  10s