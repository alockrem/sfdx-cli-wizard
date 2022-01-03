#!/bin/bash

function welcome() {
    printf "\n%s\n" "${YELLOW}${BOLD}${MSG_APP_STARTED_TITLE}${NORMAL}"     # display the app started title; sources: helpers/fonts.sh, helpers/messages.sh
    printf "%s\n\n" "${MSG_APP_STARTED_SUBTITLE}"                           # display the app started subtitle; sources: helpers/fonts.sh, helpers/messages.sh
}

function execute() {
    getExistingOrg                                                          # ref: sfdx/get.sh

    if [ -z "$EXISTING_ORG" ]; then                                         # if the EXISTING_ORG global variable is empty then:
        noExistingOrgFound                                                  # execute the appropriate function;  ref: sfdx/get.sh
    else                                                                    # if the variable is not empty then:
        confirmUseExistingOrg                                               # execute the appropriate function;  ref: sfdx/get.sh
    fi   
}