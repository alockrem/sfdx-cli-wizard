#!/bin/bash

function confirmCreateNewOrg() {
    while true; do
        printf "%s" "${MSG_CONFIRM_CREATE_ORG}"                                                         # source: helpers/messages.sh
        read -p " (y/n) " yn
        case $yn in
            [Yy]* ) createNewOrg; break;;                                                               # ref: sfdx/create.sh
            [Nn]* ) confused; break;;                                                                   # ref: helpers/results.sh
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function createNewOrg() {
    printf "%s\n\n" "${BLUE}${BOLD}${MSG_CREATING_ORG}${NORMAL}"                                        # sources: helpers/fonts.sh, helpers/messages.sh
    EXISTING_ORG=`sfdx force:org:create -f ./config/project-scratch-def.json --json | jq .result`
    parseExistingOrgProperties                                                                          # ref: sfdx/get.sh 
    printf "%s\n\n" "${GREEN}${MSG_ORG_CREATED}${NORMAL}"                                               # sources: helpers/fonts.sh, helpers/messages.sh
    confirmDeployMetadata                                                                               # ref: sfdx/deploy.sh
}