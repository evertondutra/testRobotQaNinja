*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    go to                   ${url}/login
    login with              stark                          jarvis!

    page should contain     Olá, Tony Stark. Você acessou a área logada!

Senha invalida
    [tags]                  login_error
    go to                   ${url}/login
    login with              stark                          jarvis

    ${message}=             get webelement                 id:flash
    should contain          ${message.text}                Senha é invalida!
    page should contain     Senha é invalida!

Usuario nao Cadastrado
    [tags]                  user_error
    go to                   ${url}/login
    login with              star                          jarvis!

    ${message}=             get webelement                 id:flash
    should contain          ${message.text}                O usuário informado não está cadastrado!
    page should contain     O usuário informado não está cadastrado!


*** Keywords ***
login with
    [Arguments]             ${uname}        ${pass}

    input text              css:input[name=username]        ${uname}
    input text              css:input[name=password]        ${pass}
    click element           class:btn-login