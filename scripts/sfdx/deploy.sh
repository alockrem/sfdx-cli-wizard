#!/bin/bash

function confirmDeployMetadata() {
    while true; do
        printf "%s" "${MSG_CONFIRM_DEPLOY_METADATA}"                                    # source: helpers/messages.sh
        read -p " (y/n) " yn
        case $yn in
            [Yy]* ) deployMetadata; break;;                                             # ref: sfdx/deploy.sh
            [Nn]* ) confused; break;;                                                   # ref: helpers/results.sh
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function deployMetadata() {
    printf "%s\n\n" "${BLUE}${BOLD}${MSG_DEPLOYING_METADATA}${NORMAL}"                  # sources: helpers/fonts.sh, helpers/messages.sh
    DEPLOY_RESULT=`sfdx force:source:deploy -p ./force-app --json | jq .status`
    printf "%s\n\n" "${GREEN}${MSG_METADATA_DEPLOYED}${NORMAL}"                         # sources: helpers/fonts.sh, helpers/messages.sh
    success                                                                             # source: helpers/results.sh
}