*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup    Setup Test Suite
Suite Teardown    Teardown Test Suite

*** Test Cases ***
Criar Token de Autenticação
    [Documentation]    Gera um token para autenticação
    ${TOKEN}=    Create Auth Token
    Set Suite Variable    ${TOKEN}

Listar Bookings (GET)
    [Documentation]    Lista todas as reservas disponíveis
    ${response}=    GET On Session    restful    /booking
    Should Be Equal As Integers    ${response.status_code}    200
    Should Be True    isinstance($response.json(), list)

Criar Booking (POST)
    [Documentation]    Cria um novo booking
    ${BOOKING_ID}=    Create New Booking
    Set Suite Variable    ${BOOKING_ID}

Atualizar Booking (PUT)
    [Documentation]    Atualiza um booking existente usando o token
    ${headers}=    Create Dictionary    Cookie=token=${TOKEN}
    ${body}=    Create Dictionary    
    ...    firstname=${UPDATE_FIRSTNAME}
    ...    lastname=${UPDATE_LASTNAME}
    ...    totalprice=${UPDATE_PRICE}
    ...    depositpaid=False    
    ...    bookingdates=${{ {"checkin":"${UPDATE_CHECKIN}","checkout":"${UPDATE_CHECKOUT}"} }}
    ...    additionalneeds=${UPDATE_NEEDS}
    ${response}=    PUT On Session    restful    /booking/${BOOKING_ID}    json=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    firstname
    Should Be Equal    ${response.json()}[firstname]    ${UPDATE_FIRSTNAME}

Deletar Booking (DELETE)
    [Documentation]    Remove um booking existente usando o token
    ${headers}=    Create Dictionary    Cookie=token=${TOKEN}
    ${response}=    DELETE On Session    restful    /booking/${BOOKING_ID}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201

Token Inválido (PUT)
    [Documentation]    Testa requisição com token inválido
    ${headers}=    Create Dictionary    Cookie=token=invalid_token
    ${response}=    PUT On Session    restful    /booking/1    json={"firstname":"Test"}    headers=${headers}    expected_status=400
    Should Be Equal As Integers    ${response.status_code}    400

Booking Inexistente (GET)
    [Documentation]    Testa busca de booking que não existe
    ${response}=    GET On Session    restful    /booking/999999    expected_status=404
    Should Be Equal As Integers    ${response.status_code}    404