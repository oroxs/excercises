*** settings ***
Library    Selenium2Library

*** Variables ***
${URL}      https://github.com/oroxs
${Browser}  chrome
${titile}   vedytest
${desc}     Vedy test gits
${isi}      qwertyuiop
${newDesc}      vedytest2

*** Test Cases ***
[TC-001]Scenario Create
    Launch Browser
    Create

[TC-002]Scenario Edit
    Launch Browser
    Edit

[TC-003]Scenario Delete
    Launch Browser
    Delete

[TC-004]Scenario Read
    Launch Browser
    Read

*** Keywords ***
Launch Browser
    Open browser                        ${URL}  ${Browser}
    Maximize Browser Window

Create
    Click Element       /html/body/div[1]/header/div[6]/details/summary
    Get Selected List Label     /html/body/div[1]/header/div[6]/details/details-menu
    Click Element       /html/body/div[1]/header/div[6]/details/details-menu/a[3]
    Wait Until Page Contains        Create a new repository
    Input Text      //*[@id="gists"]/div[2]/div[2]/div[1]/div[1]/input[2]      ${title}
    Input Text      //*[@id="gists"]/input       ${desc}
    Input Text      //*[@id="gists"]/div[2]/div[2]/div[2]/textarea        ${isi}
    Click Element       //*[@id="new_gist"]/div/div[2]/div/details/summary
    Click Element       //*[@id="new_gist"]/div/div[2]/div/details/details-menu/label[2]
    Wait Until Element Is Visible       //*[@id="new_gist"]/div/div[2]/div/details/details-menu/label[2]
    Click Element       //*[@id="new_gist"]/div/div[2]/div/button
    Page Should Contain     ${title}
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    Close Browser

Read
    Click Element       //*[@id="js-pjax-container"]/div[1]/div/div/div[2]/div/nav/a[2]
    Page Should Contain     ${title}
    Capture Page Screenshot     filename=selenium-screenshot-{index}.png
    Close Browser

Edit
    Click Element       //*[@id="gist-pjax-container"]/div[1]/div/div[1]/ul/li[1]/a
    Input Text      //*[@id="gists"]/input      ${newDesc}
    CLick Element       //*[@id="edit_gist_106118617"]/div/div[2]/button

Delete
    Click Element       //*[@id="gist-pjax-container"]/div[1]/div/div[1]/ul/li[2]/form/button
    Page Should Contain     Gist deleted successfully.
