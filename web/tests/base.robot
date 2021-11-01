*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              https://training-wheels-protocol.herokuapp.com

*** Keywords ***
Nova sessão
    Open Browser                     ${url}                  Google Chrome

Encerra sessão
    capture page screenshot
    close browser