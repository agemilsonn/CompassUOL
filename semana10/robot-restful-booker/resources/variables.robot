*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com
${USERNAME}    %{API_USERNAME=admin}
${PASSWORD}    %{API_PASSWORD=password123}
${TOKEN}       
${BOOKING_ID}

# Test Data Variables
${FIRSTNAME}    Joao
${LASTNAME}     Silva
${PRICE}        120
${CHECKIN}      2025-01-01
${CHECKOUT}     2025-01-10
${NEEDS}        Café da manhã
${UPDATE_FIRSTNAME}    Maria
${UPDATE_LASTNAME}     Souza
${UPDATE_PRICE}        150
${UPDATE_CHECKIN}      2025-02-01
${UPDATE_CHECKOUT}     2025-02-15
${UPDATE_NEEDS}        Jantar