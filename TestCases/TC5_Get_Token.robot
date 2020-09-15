*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  http://srv.kemoke.net:5000

*** Test Cases ***
TC5_Get_Token
    ${auth}=  create list  taba  python
    create session  mysession  ${base_url}  auth=${auth}
    ${response}=  get request  mysession  api/token

    log to console  ${response.content}

    should be equal as strings  ${response.status_code}  200