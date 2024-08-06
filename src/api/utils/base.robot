*** Settings ***
Library     String
Library     Telnet
Library     CSVLibrary
Library     Collections
Library     JSONLibrary
Library     RequestsLibrary
Library     RPA.RobotLogListener
Library     FakerLibrary    locale=pt_br
Resource    tokens.robot
Resource    geradores.robot

*** Variables ***
${file_path}    ./src/api/utils/users_hml_dados.csv
${BASE_URL}     
${URL_LOGIN}    
${URL_USUARIOS}     
${URL_PRODUTOS}    
${SessionName}      
${SuccessStatusCode}    200
${SuccessStatusCode201}     201
${MsgLoginSuccess}      Login realizado com sucesso
${UsuarioLogin}        
${SenhaLogin}            



*** Keywords ***
Create User
    Set Test Variable   ${FakeCpf}    
    Set Test Variable   ${FakeEmail} 
    Set Test Variable   ${FakeName}

Save New User Data TO Csv
    ${list}    Create List    ${FakeCpf}    ${FakeEmail}    ${FakeName}
    ${data}    create list    ${list}
    Append To Csv File    ${file_path}    ${data}    delimiter=;
