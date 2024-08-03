*** Settings ***
Resource        ./keywords.robot

*** Variables ***
${INPUT_SONG_01}=        ${name_songs["key_1"]}
${INPUT_SONG_02}=        ${name_songs["key_2"]}
${INPUT_SONG_03}=        ${name_songs["key_3"]}
${INPUT_SONG_04}=        ${name_songs["key_4"]}
${INPUT_SONG_05}=        ${name_songs["key_5"]}

*** Tasks ***
Task 01: Open Youtube And Open ${INPUT_SONG_01} Song
    Open Youtube And Open Song          ${INPUT_SONG_01}

Task 02: Open Youtube And Open ${INPUT_SONG_02} Song
    Open Youtube And Open Song          ${INPUT_SONG_02}

Task 03: Open Youtube And Open ${INPUT_SONG_03} Song
    Open Youtube And Open Song          ${INPUT_SONG_03}

Task 04: Open Youtube And Open ${INPUT_SONG_04} Song
    Open Youtube And Open Song          ${INPUT_SONG_04}

Task 05: Open Youtube And Open ${INPUT_SONG_05} Song
    Open Youtube And Open Song          ${INPUT_SONG_05}