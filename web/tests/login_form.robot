*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    go to                   ${url}/login
    input text              css:input[name=username]        stark
    input text              css:input[name=password]        jarvis!
    click element           class:btn-login

    page should contain     Olá, Tony Stark. Você acessou a área logada!

Senha invalida
    [tags]                  login_error
    go to                   ${url}/login
    input text              css:input[name=username]        stark
    input text              css:input[name=password]        jarvis
    click element           class:btn-login

    ${message}=             get webelement                 id:flash
    should contain          ${message.text}                     Senha é invalida!
    page should contain     Senha é invalida!

Usuario nao Cadastrado
    [tags]                  user_error
    go to                   ${url}/login
    input text              css:input[name=username]        star
    input text              css:input[name=password]        jarvis
    click element           class:btn-login

    ${message}=             get webelement                  id:flash
    should contain          ${message.text}                 O usuário informado não está cadastrado!
    page should contain     O usuário informado não está cadastrado!