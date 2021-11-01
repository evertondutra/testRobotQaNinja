*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    go to                   ${url}/login
    login with              stark                          jarvis!

    Should See Logged User  Tony Stark

Senha invalida
    [tags]                  login_error
    go to                   ${url}/login
    login with              stark                          jarvis

    Should contain login alert               Senha é invalida!

Usuario nao Cadastrado
    [tags]                  user_error
    go to                   ${url}/login
    login with              star                          jarvis!


    Should contain login alert               O usuário informado não está cadastrado!


*** Keywords ***
login with
    [Arguments]             ${uname}        ${pass}

    input text              css:input[name=username]        ${uname}
    input text              css:input[name=password]        ${pass}
    click element           class:btn-login

Should contain login alert
    [Arguments]             ${expect_message}
    ${message}=             get webelement                 id:flash
    should contain          ${message.text}                ${expect_message}
    page should contain     ${expect_message}

Should See Logged User
    [Arguments]             ${full_name}
    page should contain     Olá, ${full_name}. Você acessou a área logada!