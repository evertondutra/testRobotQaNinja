*** Settings ***
Resource    base.robot
Library     SeleniumLibrary

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Case ***

Deve validar o Título
        title Should Be     Training Wheels Protocol
