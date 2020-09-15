*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Variables ***
${base_url}  http://srv.kemoke.net:5000
${user}  dzenana
${pass}  etf
${id}  32

*** Test Cases ***
TC2_Put_Request
    create session  AddData  ${base_url}
    ${body}=  create dictionary  id=${id}  username=${user}  password=${pass}
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  put request  AddData  api/users/${id}  data=${body}  headers=${header}

    ${response1}=  get request  AddData  api/users/${id}
    log to console  ${response1.content}

    should be equal as strings  ${response.status_code}  201

