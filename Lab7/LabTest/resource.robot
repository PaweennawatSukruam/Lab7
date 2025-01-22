***Settings***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

***Variables***
${SERVER}         localhost:7272
${BROWSER}        custom_chrome
${CHROME_BROWSER_PATH}     C:\\Users\\few66\\Downloads\\chrome-win64\\chrome-win64\\chrome.exe
${CHROME_DRIVER_PATH}      C:\\Users\\few66\\Downloads\\chrome-win64\\chrome-win64\\chromedriver.exe
${DELAY}          0.5
${VALID FIRSTNAME}    Somsong
${VALID LASTNAME}    Sandee
${VALID DESTINATION}    Europe
${VALID CONTACTPERSON}    Sodsai Sandee
${VALID RELATIONSHIP}    Mother
${VALID EMAIL}    somsong@kkumail.com
${VALID PHONE}    081-111-1234
${FORM URL}    http://${SERVER}/Form.html    
${COMPLETE URL}    http://${SERVER}/Complete.html

*** Keywords ***

Open Form
    Open Custom Chrome Browser    ${FORM URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Form Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Input Firstname
    [Arguments]    ${firstname}
    Input text    firstname    ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input text    lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input text    destination    ${destination}

Input ContactPerson
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}
    
Input Email    
    [Arguments]    ${email}
    Input text    email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input text    phone    ${phone}

Input Info
    [Arguments]    ${firstname}    ${lastname}    ${destination}    ${contactperson}    ${relationship}    ${email}    ${phone}
    Input Firstname    ${firstname}
    Input Lastname    ${lastname}
    Input Destination    ${destination}
    Input ContactPerson    ${contactperson}
    Input Relationship    ${relationship}
    Input Email    ${email}
    Input Phone    ${phone}

Submit
    Click Button    submitButton

Complete Page Should Be Open
    Title Should Be    Completed
    ${H1_TEXT}    Get Text    xpath=//h1
    Should Contain   ${H1_TEXT}    Our agent will contact you shortly.
    ${H2_TEXT}    Get Text    xpath=//h2
    Should Contain    ${H2_TEXT}    Thank you for your patient.

Empty Destination
    ${ERROR_TEXT}    Get Text    xpath=//p
    Should Contain    ${ERROR_TEXT}    Please enter your destination 

Empty Email
    ${ERROR_TEXT}    Get Text    xpath=//p
    Should Contain    ${ERROR_TEXT}    Please enter a valid email address.

Invalid Email
    ${ERROR_TEXT}    Get Text    xpath=//p
    Should Contain    ${ERROR_TEXT}    Please enter a valid email address.

Empty Phone
    ${ERROR_TEXT}    Get Text    xpath=//p
    Should Contain    ${ERROR_TEXT}    Please enter a phone number 

Invalid Phone
    ${ERROR_TEXT}    Get Text    xpath=//p
    Should Contain    ${ERROR_TEXT}    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678

Open Custom Chrome Browser
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Set Variable    ${options}    binary_location    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${options}    service=${service}
    Go To    ${url}