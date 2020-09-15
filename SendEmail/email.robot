*** Settings ***
Library  JSONLibrary
Library  Collections
Library  Email.py
Library  Dialogs

*** Test Cases ***
Send_Email
    ${json}=  load json from file  ../testnizad/Documentation/document.json
    ${json_obj}=  get from dictionary  ${json}  data
    ${keys}=  get dictionary keys  ${json_obj}
    ${number}=  get length  ${keys}
    ${emails}=  create list
    ${i}=  set variable  0

    FOR  ${i}  IN RANGE  ${number}
        ${email}=  get value from json  ${json}  $.data[${keys[${i}]}].['email']
        append to list   ${emails}  ${email[0]}
    END

    ${username}=   get value from user   Input user name
    ${password}=  get value from user  Input password  hidden=yes

    FOR  ${i}  IN RANGE  ${number}
        sendMail  ${username}  ${password}  ${emails[${i}]}
    END







