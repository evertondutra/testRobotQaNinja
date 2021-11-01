*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Verifica o valor ao informar o numero da linha
    go to                       ${url}/tables
    table row should contain    id: actors          1       @robertdowneyjr

Descobre a linha pelo texto chave e valida demais valores
    go to                   ${url}/tables
    ${target}=              get webelement           xpath:.//tr[contains(.,'@chadwickboseman')]
    log                     ${target.text}
    log to console          ${target.text}
    should contain          ${target.text}           $ 700.000
    should contain          ${target.text}           Pantera Negra