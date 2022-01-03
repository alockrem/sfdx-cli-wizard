#!/bin/bash

function confirmDeleteExistingOrg() {
    while true; do
        printf "%s" "${RED}${MSG_CONFIRM_DELETE_EXISTING_ORG}${NORMAL}"         # sources: helpers/fonts.sh, helpers/messages.sh
        read -p " (y/n) " yn
        case $yn in
            [Yy]* ) deleteExistingOrg; break;;                                  # ref: sfdx/delete.sh
            [Nn]* ) confused; break;;                                           # ref: helpers/results.sh
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function deleteExistingOrg() {
    printf "%s\n\n" "${BLUE}${BOLD}${MSG_DELETING_ORG}${NORMAL}"                # sources: helpers/fonts.sh, helpers/messages.sh
    DELETE_RESULT=`sfdx force:org:delete -u $EXISTING_USERNAME -p`              # source: sfdx/get.sh
    printf "%s\n\n" "${GREEN}${MSG_ORG_DELETED}${NORMAL}"                       # sources: helpers/fonts.sh, helpers/messages.sh
    confirmCreateNewOrg                                                         # ref: sfdx/create.sh
}