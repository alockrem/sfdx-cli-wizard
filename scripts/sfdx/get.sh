#!/bin/bash

function getExistingOrg() {
    printf "%s\n\n" "${BLUE}${BOLD}${MSG_ORG_SEARCHING}${NORMAL}"                           # sources: helpers/fonts.sh, helpers/messages.sh
    EXISTING_ORG=`sfdx force:org:list --json | jq -e ".result.scratchOrgs[0] // empty"`
    parseExistingOrgProperties                                                              # ref: sfdx/get.sh (self)
}

function parseExistingOrgProperties() {
    if [ ! -z "$EXISTING_ORG" ]                                                             # source: sfdx/get.sh (self)
    then
        EXISTING_USERNAME=`echo $EXISTING_ORG | jq -r .username`                            # source: sfdx/get.sh (self)
        EXISTING_EXPIRATION_DATE=`echo $EXISTING_ORG | jq -r .expirationDate`               # source: sfdx/get.sh (self)
    fi
}

function noExistingOrgFound() {
    printf "%s\n\n" "${RED}${MSG_NO_ORG_FOUND}${NORMAL}"                                    # sources: helpers/fonts.sh, helpers/messages.sh
    confirmCreateNewOrg                                                                     # ref: sfdx/create.sh
}

function confirmUseExistingOrg() {
    while true; do
        printExistingOrgDetails                                                             # ref: sfdx/get.sh (self)
        printf "%s" "${MSG_CONFIRM_USE_EXISTING_ORG}"
        read -p " (y/n) " yn
        case $yn in
            [Yy]* ) setConfigDefaultUsername; confirmDeployMetadata; break;;                # refs: sfdx/config.sh, sfdx/deploy.sh
            [Nn]* ) confirmDeleteExistingOrg; break;;                                       # ref: sfdx/delete.sh
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function printExistingOrgDetails() {
        printf "%s\n" "Username: ${YELLOW}${EXISTING_USERNAME}${NORMAL}"                    # sources: helpers/fonts.sh, helpers/messages.sh
        printf "%s\n\n" "Expiration Date: ${YELLOW}${EXISTING_EXPIRATION_DATE}${NORMAL}"    # sources: helpers/fonts.sh, helpers/messages.sh
}