*** Settings ***
Documentation  This file contains test case related to adding address and checking out
...     important note : it is advisable to place the cursor at any place that doesn't interrupt the site activity
...     As while placing the cursor when  chumbak site is processing,it may mouse over on some categories and will interrupt your process


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
    Click Element   xpath=//a[@class='Button Button--primary']
    #Sometimes after excecuting the above line the site may go to the previous page while excecuting the next line
    #so do re-run the script to proceed further
    Click Element   xpath=//button[contains(normalize-space(),'Add a new address')]
    Input Text   name=address[first_name]    Aparna
    Input Text   name=address[last_name]    Mohanan
    Input Text   name=address[company]    APMO
    Input Text   name=address[phone]    9087654395
    Input Text   name=address[address1]    Peruvilai
    Input Text   name=address[address2]    kanyakumari
    Input Text   name=address[city]    Nagercoil
    Select From List By Label   name=address[country]  India
    Input Text   name=address[zip]    629008
    Select From List By Label   name=address[province]  Tamil Nadu
    Click Element   xpath=//input[@class='Form__Checkbox']
    Click Element   xpath=//button[@class='Form__Submit Button Button--primary Button--full']
    Click Element   xpath=//a[@aria-label='Open cart']
    ${continue}  Get WebElement   xpath=//a[@class='continue-shopping Button Button--primary Button--full']
    Execute Javascript  arguments[0].click()  ARGUMENTS      ${continue}
    Click Element   xpath=(//a[contains(normalize-space(),'Sale')])[2]
    Click Element   id=AddToCart
    Click Element   xpath=//*[normalize-space()='Checkout']
    Click Element   xpath=//button[@class='step__footer__continue-btn btn']
    Page Should Contain   Shipping method
    Element Should Contain   xpath=//p[contains(text(),'This pincode is not serviceable for this Product')]  This pincode is not serviceable for this Product Flower Owl Sling Bag
    Sleep   5s