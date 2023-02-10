*** Settings ***
Documentation  This file contains test case related to add to cart and checking out with some error message
...     important note : it is advisable to place the cursor at any place that doesn't interrupt the site activity
...     As while placing the cursor when  chumbak site is processing may mouse over on some categories and will interrupt your process

Resource    ../resource/base/common_functionalities.resource
Test Setup  Launch Browser And Navigate To Url
Test Teardown  Close Browser

*** Test Cases ***
Add to Cart
    Click Element   id=user_6_
    Click Element   link=Login
    Input Text   name=customer[email]    aparnamohanan@gmail.com
    Input Text   name=customer[password]  aparna_123
    Click Element   xpath=//button[text()='Login']
    Input Text   id=mm-homepage-search    watch
    Wait Until Element Is Visible   xpath=//span[text()='Sort by : ']  timeout=20s
    Mouse Over   xpath=//span[text()='Sort by : ']
    Wait Until Element Is Visible   link=Price, low to high
    Click Element   link=Price, low to high
    Wait Until Element Is Visible   xpath=(//*[@class='st-mm-custom-product-page-atc'])[1]  timeout=20s
    Click Element   xpath=(//*[@class='st-mm-custom-product-page-atc'])[1]
    Input Text   id=mm-homepage-search    living
    Wait Until Element Is Visible   xpath=(//*[@class='st-mm-custom-product-page-atc'])[1]  timeout=20s
    Click Element   xpath=(//*[@class='st-mm-custom-product-page-atc'])[1]
    Click Element   xpath=//*[@class='Header__Icon Icon-Wrapper Icon-Wrapper--clickable Cart-Header']
    Click Element   xpath=//a[contains(text(),'Makeup Buff Pouch-Blue & Green')]
    ${addtocart}  Get WebElement   xpath=//*[text()='Add to cart']
    Execute Javascript  arguments[0].click()  ARGUMENTS      ${addtocart}
    Click Element   xpath=//a[@aria-label='Open cart']
    ${checkout}  Get WebElement   xpath=//*[text()='Checkout']
    Execute Javascript  arguments[0].click()  ARGUMENTS      ${checkout}
    Input Text   id=checkout_reduction_code    adsg456
    ${apply}  Get WebElement   xpath=//*[text()='Apply']
    Execute Javascript  arguments[0].click()  ARGUMENTS      ${apply}
    Element Should Contain   xpath=//p[contains(text(),'Enter a valid discount')]  Enter a valid discount code or gift card
    sleep  15s





