*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Selecionar por texto e validar pelo valor
    Go to                       ${url}/dropdown
    select from list by label   class:avenger-list          Scott Lang
    ${selected}=                get selected list value     class:avenger-list
    Should Be Equal             ${selected}                 7

Selecionar pelo valor e validar pelo texto

    go to                       ${url}/dropdown
    select from list by value   id:dropdown                 6
    ${selected}=                get selected list label     id:dropdown
    Should Be equal             ${selected}                 Loki