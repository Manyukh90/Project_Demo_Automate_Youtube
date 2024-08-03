*** Settings ***
Resource        ./settting.robot
Resource        ./variables.robot

*** Keywords ***
Robot Run Bash Script Clean Log Img
    ${result}=        Run Process        ./script_clean_log_img.bash

Open Browser And Go To Home Page Yotube
    Open Browser      ${URL}      ${BROWSER}    
    Set Selenium Speed        ${SPEED}
    Maximize Browser Window
    Capture Page Screenshot        
    
Close Browser Youtube
    Close All Browsers

Validate Open Home Page Yotube 
    Wait Until Element Is Visible        ${ELEMENT_MENU_HOME}
    Element Should Contain        ${ELEMENT_MENU_HOME}        Home

Searching Song
    [Arguments]        ${INPUT_SONG}
    Element Should Be Visible        ${ELEMENT_SEARCH}
    Input Text        ${ELEMENT_SEARCH}        ${INPUT_SONG}

Click Btn Search 
    Click Element        ${ELEMENT_BTN_SEARCH}

Validate Open Searching Baby Shark Song
    [Arguments]        ${INPUT_SONG}
    Wait Until Element Is Visible        ${ELEMENT_VIDEO_LIST}
    ${text}=        Get Text        ${ELEMENT_VIDEO_LIST}
    Should Contain        ${text}        ${INPUT_SONG}

Get Time Duration
    Press Keys    None    SPACE
    Wait Until Element Is Visible        xpath=//span[@class="ytp-time-duration"]
    ${res}=        Get Text        xpath=//span[@class="ytp-time-duration"]
    # Log To Console        \n***** time duration: ${res}
    Press Keys    None    SPACE
    ${total_seconds}=        Convert Time To Seconds        ${res}
    # Log To Console        \n***** time duration total_seconds:${total_seconds}
    RETURN        ${total_seconds}

Click Link For Playing The Song
    Scroll Element Into View        ${ELEMENT_VIDEO_LIST}
    Click Element        ${ELEMENT_VIDEO_LIST}

    Skip Video Ads
    Skip Video Ads

    ${is_ads}=        Set Variable        True
    # Log To Console        \n***** is_ads:${is_ads}
    WHILE    "${is_ads}" == "True"
        ${res}=        Get Time Duration
        ${int_res}=        Convert To Integer        ${res}
        # Log To Console        \n***** int_res:${int_res}
        IF    ${int_res} > 90
            ${is_ads}=        Set Variable        False
            Exit For Loop
        ELSE
            Sleep        ${res}s
        END
    END

    Press Keys    None    SPACE
    ${time_duration_song}=        Get Time Duration
    Log To Console       ***** time_duration_song: ${time_duration_song} 
    Press Keys    None    SPACE
    Sleep        ${time_duration_song}s

Click Humberger Munu
    Click Element        ${ELEMENT_HUMBURGER_MENU}

Go To History Page
    Wait Until Element Is Visible        ${ELEMENT_MENU_HOME}
    Scroll Element Into View        ${ELEMENT_MENU_HISTORY}
    Click Element        ${ELEMENT_MENU_HISTORY}
    Sleep        10s

Skip Video Ads
    Sleep        7s
    ${res}=        Run Keyword And Return Status        Element Should Not Be Visible        ${ELEMENT_SKIP_ADS}
    IF    "${res}" != "True"
            Click Element        ${ELEMENT_SKIP_ADS}
    END
    Sleep        10s

Open Youtube And Open Song 
    [Arguments]        ${INPUT_SONG}
    Robot Run Bash Script Clean Log Img
    Open Browser And Go To Home Page Yotube
    Validate Open Home Page Yotube
    Searching Song        ${INPUT_SONG}
    Click Btn Search
    Validate Open Searching Baby Shark Song        ${INPUT_SONG}
    Click Link For Playing The Song
    Click Humberger Munu
    Go To History Page
    Close Browser Youtube
