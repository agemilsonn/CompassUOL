*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   variables.robot

*** Keywords ***
Setup Test Suite
    Create Session    restful    ${BASE_URL}    verify=True

Teardown Test Suite
    Delete All Sessions

Create Auth Token
    [Documentation]    Creates authentication token and returns it
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    restful    /auth    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    token
    ${token}=    Get From Dictionary    ${response.json()}    token
    Should Not Be Empty    ${token}
    RETURN    ${token}

Create New Booking
    [Documentation]    Creates a new booking and returns booking ID
    ${body}=    Create Dictionary    
    ...    firstname=${FIRSTNAME}
    ...    lastname=${LASTNAME}
    ...    totalprice=${PRICE}
    ...    depositpaid=True    
    ...    bookingdates=${{ {"checkin":"${CHECKIN}","checkout":"${CHECKOUT}"} }}
    ...    additionalneeds=${NEEDS}
    ${response}=    POST On Session    restful    /booking    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    bookingid
    ${booking_id}=    Get From Dictionary    ${response.json()}    bookingid
    Should Be True    ${booking_id} > 0
    RETURN    ${booking_id}