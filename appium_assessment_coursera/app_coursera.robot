*** Settings ***


Library    AppiumLibrary

*** Test Cases ***

Select Courses
    [Documentation]       working with native app
    ...   for automating sign up activity and selecting the course
    ...   then will be validating part of text in the page
    Open Application   remote_url=http://localhost:4723/wd/hub
    ...   platformName=android
    ...   deviceName=redminote5pro
    ...   appPackage=org.coursera.android
    ...   appActivity=org.coursera.android.MainActivity

    Set Appium Timeout   30s
    Wait Until Page Contains Element   xpath=//android.widget.Button[@text='New to Coursera? Create Account']
    Click Element   xpath=//android.widget.Button[@text='New to Coursera? Create Account']
    Wait Until Page Contains Element   xpath=//android.widget.EditText[@text='Full Name (Required)']
    Input Text   xpath=//android.widget.EditText[@text='Full Name (Required)']    APARNA MOHANAN
    Wait Until Page Contains Element   xpath=//android.widget.EditText[@text='E-mail (Required)']
    Input Text   xpath=//android.widget.EditText[@text='E-mail (Required)']   aparna123@gmail.com
    Wait Until Page Contains Element   xpath=//android.widget.EditText[@text='Password (Required)']
    Input Text   xpath=//android.widget.EditText[@text='Password (Required)']   aparna123
    Wait Until Page Contains Element   xpath=//android.widget.Button[@text='Create New Account']
    Click Element   xpath=//android.widget.Button[@text='Create New Account']
    Wait Until Page Contains Element   xpath=//android.widget.Button[@text='Explore courses']
    Click Element   xpath=//android.widget.Button[@text='Explore courses']
    Wait Until Page Contains Element   xpath=//android.widget.EditText[@resource-id='org.coursera.android:id/search_src_text']
    Click Element    xpath=//android.widget.EditText[@resource-id='org.coursera.android:id/search_src_text']
    Input Text   xpath=//android.widget.EditText[@resource-id='org.coursera.android:id/search_src_text']  robot
    Hide Keyboard
    ${count}  Get Matching Xpath Count   xpath=//android.widget.TextView[contains(@text,'making the case for robotic')]
    WHILE   ${count}==0
      Swipe By Percent   90    75    90    25
      ${count}  Get Matching Xpath Count   xpath=//android.widget.TextView[contains(@text,'making the case for robotic')]
    END
    Wait Until Page Contains Element   xpath=//android.widget.TextView[contains(@text,'making the case for robotic')]
    Click Element   xpath=//android.widget.TextView[contains(@text,'making the case for robotic')]
    Wait Until Page Contains Element   xpath=//android.widget.TextView[contains(@text,'Making the Case for Robotic')]
    Click Element   xpath=//android.widget.TextView[contains(@text,'Making the Case for Robotic')]
    Wait Until Page Contains Element   xpath=//*[contains(@text,'About this Course')]  30s
    ${text}     Get Text    xpath=//*[contains(@text,'About this Course')]
    Log To Console    ${text}
    Element Text Should Be   xpath=//*[contains(@text,'About this Course')]  About this Course
    sleep  5s
    [Teardown]  Close Application

