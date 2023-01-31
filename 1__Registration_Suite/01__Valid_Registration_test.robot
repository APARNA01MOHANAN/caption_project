*** Settings ***
Documentation  This file contains test cases related to valid registration
...  re-run the script in case of any failure

Resource    ../resource/base/common_functionalities.resource


Library  DataDriver  file=../test_input_data/CHUMBAK_DATA.xlsx  sheet_name=Valid_Register_Test
Test Setup  Launch Browser And Navigate To Url
Test Teardown  Close Browser

Test Template  Valid Registration Template

*** Test Cases ***
Valid Registration Testcase_${test_case}

*** Keywords ***
Valid Registration Template
    [Arguments]  ${firstname}  ${lastname}  ${mailid}  ${password}  ${expected_msg}
    Click Element   id=user_6_
    Click Element   link=Login
    Click Element   link=Create one
    Input Text   name=customer[first_name]    ${firstname}
    Input Text   name=customer[last_name]    ${lastname}
    Input Text   name=customer[email]    ${mailid}
    Input Text   name=customer[password]    ${password}
    ${login}  Get WebElement   xpath=//button[text()='Create my account']
    Execute Javascript  arguments[0].click()  ARGUMENTS      ${login}
    Element Should Contain   link=reset your password    ${expected_msg}
    sleep  5s