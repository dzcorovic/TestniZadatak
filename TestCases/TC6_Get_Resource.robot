*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${base_url}  http://srv.kemoke.net:5000
${user}  dzenanac
${pass}  etf123

*** Test Cases ***
TC6_Get_Resource
    ${auth}=  create list  ${user}  ${pass}
    create session  mysession  ${base_url}  auth=${auth}

    ${response1}=  get request  mysession  api/token
    ${token}=  set variable   ${response1.json()['token']}

    ${body}=  create dictionary  username=${token}
    ${response}=  get request  mysession  api/resource  data={body}

    log to console  ${response.content}

    should be equal as strings  ${response.status_code}  200
