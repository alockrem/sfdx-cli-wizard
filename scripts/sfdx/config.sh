#!/bin/bash

function setConfigDefaultUsername() {
    printf "%s\n\n" "${BLUE}${BOLD}${MSG_SETTING_DEFAULT_USERNAME}${NORMAL}"                            # sources: helpers/fonts.sh, helpers/messages.sh
    CONFIG_RESULT=`sfdx force:config:set defaultusername=${EXISTING_USERNAME} --json | jq .result`      # source: sfdx/get.sh
    printf "%s\n\n" "${GREEN}${MSG_DEFAULT_USERNAME_SET}${NORMAL}"                                      # sources: helpers/fonts.sh, helpers/messages.sh
}
