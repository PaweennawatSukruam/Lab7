***Settings***
Resource    resource.robot

***Test Cases***
Open Form
    Open Form
    [Teardown]    Close Browser
Empty Destination
    Open Form
    Input Info    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${EMPTY}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${VALID PHONE}
    Submit
    Empty Destination
    [Teardown]    Close Browser

Open Form
    Open Form
    [Teardown]    Close Browser
Empty Email
    Open Form
    Input Info    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${EMPTY}    ${VALID PHONE}
    Submit
    Empty Email
    [Teardown]    Close Browser

Open Form
    Open Form
    [Teardown]    Close Browser
Invalid Email
    Open Form
    Input Info    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    somsong@    ${VALID PHONE}
    Submit
    Invalid Email
    [Teardown]    Close Browser

Open Form
    Open Form
    [Teardown]    Close Browser
Empty Phone Number
    Open Form
    Input Info    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${EMPTY}
    Submit
    Empty Phone
    [Teardown]    Close Browser

Open Form
    Open Form
    [Teardown]    Close Browser
Invalid Phone Number
    Open Form
    Input Info    ${VALID FIRSTNAME}    ${VALID LASTNAME}    ${VALID DESTINATION}    ${VALID CONTACTPERSON}    ${VALID RELATIONSHIP}    ${VALID EMAIL}    ${191}
    Submit
    Invalid Phone
    [Teardown]    Close Browser