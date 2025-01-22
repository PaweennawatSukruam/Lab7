***Settings***
Resource    resource.robot

***Test Cases***
Open Form
    Open Form
    [Teardown]    Close Browser
Record Success
    Open Form
    Input Info    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${VALID PHONE}
    Submit
    Complete Page Should Be Open
    [Teardown]    Close Browser
