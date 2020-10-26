*** settings ***
Library    Selenium2Library

*** Variables ***
${URL}      https://www.ebay.com/
${Browser}  chrome
${keyword}  Macbook
${min}      1000000
${max}      2500000

*** Test Cases ***
[TC-001]Scenario 1
    Launch Browser
    Homepage

[TC-002]Scenario 2
    Launch Browser
    Search

*** Keywords ***
Launch Browser
    Open browser                        ${URL}  ${Browser}
    Maximize Browser Window

Homepage
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    Mouse Over      //*[@id="mainContent"]/div[1]/ul/li[3]/a
    Click Element    //*[@id="mainContent"]/div[1]/ul/li[3]/div[2]/div[1]/div[1]/ul/li[1]/a
    Page Should Contain     Cell Phones, Smart Watches & Accessories
    Click Element       //*[@id="s0-29-13_2-0-1[0]-0-0"]/ul/li[3]/a
    Wait Until Page Contains        More refinements...
    Page Should Contain     More refinements...
    Click Element       //*[@id="s0-29-13-0-1[1]-0-6-2"]/button
    Wait Until Element Is Visible       //*[@id="x-overlay__form"]
    Set Focus To Element        //*[@id="x-overlay__form"]
    Click Element       //*[@id="c3-mainPanel-Screen%20Size"]
    Wait Until Element Is Visible       //*[@id="c3-subPanel-Screen%20Size_4.0%20-%204.4%20in_cbx"]
    Select Checkbox     //*[@id="c3-subPanel-Screen%20Size_4.0%20-%204.4%20in_cbx"]
    Click Element       //*[@id="c3-mainPanel-price"]
    Wait Until Element Is Visible       //*[@id="c3-subPanel-_x-price-textrange"]/div
    Input Text      //*[@id="c3-subPanel-_x-price-textrange"]/div/div[1]/div/input      ${min}
    Input Text      //*[@id="c3-subPanel-_x-price-textrange"]/div/div[2]/div/input      ${max}
    Click Element       //*[@id="c3-mainPanel-location"]/span
    Wait Until Element Is Visible       //*[@id="x-overlay__form"]/div[1]/div[2]
    Wait Until Element Is Visible       //*[@id="c3-subPanel-location_Asia"]/label
    Click Element     //*[@id="c3-subPanel-location_Asia"]/label
    Click Button     //*[@id="c3-footerId"]/div[2]/button
    Page Should Contain     ${min}
    Page Should Contain     ${max}
    Wait Until Element Is Visible       //*[@id="s0-29-13-0-1[1]-0-6-0-0[0]-multiselect[]_32"]/a
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    Close Browser

Search
    Input Text      //*[@id="gh-ac"]        ${keyword}
    Click Element       //*[@id="gh-cat-box"]
    Get Selected List Label     //*[@id="gh-cat"]
    Click Element       //*[@id="gh-cat"]/option[12]
    Click Element       //*[@id="gh-btn"]
    Wait Until Page Contains    ${keyword}
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    Close Browser