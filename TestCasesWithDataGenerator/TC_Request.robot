*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  TestData.py
Library  FakerLibrary
Library  Collections

*** Variables ***
${base_url}  http://srv.kemoke.net:5000

*** Test Cases ***
Test_Cases
    # test data

    ${username}=  getFakerUserName
    should not be empty  ${username}

    ${password}=  getFakerPassword
    should not be empty  ${password}

    #post_request

    create session  AddData  ${base_url}
    ${body}=  create dictionary  username=${username}  password=${password}
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  api/users  data=${body}  headers=${header}

    log to console  ${response.content}
    should be equal as strings  ${response.status_code}  201

    # put request

    ${id}=  set variable  ${response.json()['id']}
    ${newuser}=  FakerLibrary.user_name
    ${body}=  create dictionary  username=${newuser}    password=${password}
    ${response1}=  put request  AddData  api/users/${id}  data=${body}  headers=${header}

    log to console  ${response1.content}
    should be equal as strings  ${response1.status_code}  201

    # get token

    ${auth}=  create list  ${newuser}  ${password}
    create session  mysession  ${base_url}  auth=${auth}
    ${response2}=  get request  mysession  api/token

    log to console  ${response2.content}
    should be equal as strings  ${response2.status_code}  200

    # get resource

    ${token}=  set variable  ${response2.json()['token']}
    ${body}=  create dictionary  username= ${token}
    ${response3}=  get request  mysession  api/resource  data={body}

    log to console  ${response3.content}
    should be equal as strings   ${response3.status_code}  200

    # delete request

    ${response4}=  delete request  mysession  api/users/${id}

    log to console  ${response4.content}
    should be equal as strings  ${response4.status_code}  200

