*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://srv.kemoke.net:5000
${id}  32

*** Test Cases ***
TC4_Delete_Request
    create session  DeleteData  ${base_url}
    ${response}=  delete request  DeleteData  /api/users/${id}

    log to console  ${response.content}

    should be equal as strings  ${response.status_code}  200

