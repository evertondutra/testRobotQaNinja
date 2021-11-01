*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Verifica o valor ao informar o numero da linha
    go to                       ${url}/tables
    table row should contain    id: actors          1       @robertdowneyjr