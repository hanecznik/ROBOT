*** Settings ***
Library    RequestsLibrary
*** Variables ***
${token}     166fab01414bed4af2662b6f3c4a7185445584ad12a7abd73269e537c9945195
*** Test Cases ***
STATUS_TEST
    ${get_response}    GET   https://simple-books-api.glitch.me/status
    Log to console   status ${get_response}
#REGISTRATION_TEST
#    ${register_json}    Create Dictionary       clientName=Mariaa        clientEmail=maria@maria.pl
#    ${post_register_json}   POST    https://simple-books-api.glitch.me/api-clients/     json=${register_json
ORDER
    ${headers}     Create Dictionary    Content-Type=application/json      Authorization=Bearer ${token}
    ${order_body}    Create Dictionary    bookId=4    customerName=Maria_1

    ${post_order_response}    POST    https://simple-books-api.glitch.me/orders  headers=${headers}    json=${order_body}

#    Log to console - wypisz w Terminalu "Response 200"
#Api_TEST_2
#    ${get_response}    GET   https://simple-books-api.glitch.me/books
#    Log to console    books ${get_response}
