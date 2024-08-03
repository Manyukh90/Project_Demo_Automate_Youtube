*** Settings ***
Resource        ./settting.robot

*** Variables ***
${URL}=        https://www.youtube.com/
${BROWSER}=        Chrome
${SPEED}=        0.5

${ELEMENT_MENU_HOME}=        xpath=(//a[@id="endpoint"]/tp-yt-paper-item/yt-formatted-string)[1]
${ELEMENT_MENU_HISTORY}=        xpath=//a[@id="endpoint" and @title="History"]

${ELEMENT_SEARCH}=        xpath=//input[@id="search"]
${ELEMENT_BTN_SEARCH}=        xpath=//button[@id="search-icon-legacy"]
${ELEMENT_VIDEO_LIST}=        xpath=(//a[@id="video-title"]/yt-formatted-string)[1]
${ELEMENT_HUMBURGER_MENU}=        xpath=//button[@id="button"]/yt-icon[@id="guide-icon" and @class="style-scope ytd-masthead"]
${ELEMENT_SKIP_ADS}=        xpath=//button[@id="skip-button:3"]/div