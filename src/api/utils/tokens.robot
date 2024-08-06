*** Settings ***
Resource    base.robot

*** Variables ***
${teste}        teste

*** Keywords ***
Obter Token
    [Documentation]    Exemplo de obtenção de token
    Create Session    ${sessionName}    ${BASE_URL}
    ${data}    Create Dictionary    email=${usuarioLogin}    password=${senhaLogin}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    ${sessionName}    ${URL_LOGIN}    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    ${successStatusCode}
    ${json_response}    Set Variable    ${response.json()}
    ${authorization}    Set Variable    ${json_response["authorization"]}
    Set Global Variable    ${TOKEN}    ${authorization}
    Log    ${authorization}
