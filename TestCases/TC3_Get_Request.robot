*** Settings ***
Library  RequestsLibrary

*** Variables ***
${base_url}  http://srv.kemoke.net:5000
${id}  32

*** Test Cases ***
TC3_Get_Request
    create session  Get_Details  ${base_url}
    ${response}=  get request  Get_Details  api/users/${id}

    log to console  ${response.content}
    should be equal as strings  ${response.status_code}  200