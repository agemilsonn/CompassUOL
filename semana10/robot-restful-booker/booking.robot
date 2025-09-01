*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com
${USERNAME}    admin
${PASSWORD}    password123
${TOKEN}       
${BOOKING_ID}  

*** Test Cases ***
Criar Token de Autenticação
    [Documentation]    Gera um token para autenticação
    Create Session    restful    ${BASE_URL}    verify=True
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    restful    /auth    json=${body}
    Log To Console    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200
    ${TOKEN}=    Get From Dictionary    ${response.json()}    token
    Set Suite Variable    ${TOKEN}

Listar Bookings (GET)
    [Documentation]    Lista todas as reservas disponíveis
    Create Session    restful    ${BASE_URL}    verify=True
    ${response}=    GET On Session    restful    /booking
    Log To Console    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200

Criar Booking (POST)
    [Documentation]    Cria um novo booking
    Create Session    restful    ${BASE_URL}    verify=True
    ${body}=    Create Dictionary    
    ...    firstname=Joao    
    ...    lastname=Silva    
    ...    totalprice=120    
    ...    depositpaid=True    
    ...    bookingdates=${{ {"checkin":"2025-01-01","checkout":"2025-01-10"} }}
    ...    additionalneeds=Café da manhã
    ${response}=    POST On Session    restful    /booking    json=${body}
    Log To Console    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200
    ${BOOKING_ID}=    Get From Dictionary    ${response.json()}    bookingid
    Set Suite Variable    ${BOOKING_ID}

Atualizar Booking (PUT)
    [Documentation]    Atualiza um booking existente usando o token
    Create Session    restful    ${BASE_URL}    headers={"Cookie":"token=${TOKEN}"}    verify=True
    ${body}=    Create Dictionary    
    ...    firstname=Maria    
    ...    lastname=Souza    
    ...    totalprice=150    
    ...    depositpaid=False    
    ...    bookingdates=${{ {"checkin":"2025-02-01","checkout":"2025-02-15"} }}
    ...    additionalneeds=Jantar
    ${response}=    PUT On Session    restful    /booking/${BOOKING_ID}    json=${body}
    Log To Console    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200

Deletar Booking (DELETE)
    [Documentation]    Remove um booking existente usando o token
    Create Session    restful    ${BASE_URL}    headers={"Cookie":"token=${TOKEN}"}    verify=True
    ${response}=    DELETE On Session    restful    /booking/${BOOKING_ID}
    Should Be Equal As Integers    ${response.status_code}    201
