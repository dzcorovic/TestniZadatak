*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Variables ***
${base_url}  http://srv.kemoke.net:5000
${user}  ananana
${pass}  123456

*** Test Cases ***
TC1_Post_Request
    create session  AddData  ${base_url}
    ${body}=  create dictionary  username=${user}  password=${pass}
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  api/users  data=${body}  headers=${header}

    log to console  ${response.content}

    should be equal as strings  ${response.status_code}  201






