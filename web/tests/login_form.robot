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

    go to                   ${url}/login
    input text              css:input[name=username]        stark
    input text              css:input[name=password]        jarvis
    click element           class:btn-login

    page should contain      Senha é invalida!