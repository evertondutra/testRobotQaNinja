
*** Settings ***
Library     app.py

*** Test Case ***
Deve retornar mensagemde boas vindas
    ${result}=          Welcome         Everton
    Should Be Equal     ${result}       Olá Everton, bem vindo ao curso!