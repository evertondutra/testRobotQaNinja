*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Variables ***
${check_thor}       id:thor
${check_ironman}    css:input[value="iron-man"]
${check_pantera}    xpath://*[@id='checkboxes']/input[7]

*** Test Case ***

Marcando opção Id
    go to                            ${url}/checkboxes
    select checkbox                  ${check_thor}
    checkbox should be selected      ${check_thor}

Marcando opção com CssSelector
    go to                            ${url}/checkboxes
    select checkbox                  ${check_ironman}
    checkbox should be selected      ${check_ironman}

Marcando opção com Xpath
    [tags]      ironman
    go to                            ${url}/checkboxes
    select checkbox                  ${check_pantera}
    checkbox should be selected      ${check_pantera}

