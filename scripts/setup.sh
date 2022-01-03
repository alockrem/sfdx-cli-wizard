#!/bin/bash

# Import Salesforce DX actions
source ./scripts/sfdx/config.sh
source ./scripts/sfdx/create.sh
source ./scripts/sfdx/delete.sh
source ./scripts/sfdx/deploy.sh
source ./scripts/sfdx/get.sh

# Import helpers
source ./scripts/helpers/app.sh             # application functions (welcome, execute)
source ./scripts/helpers/fonts.sh           # font manipulation (colors, bold)
source ./scripts/helpers/messages.sh        # output messages
source ./scripts/helpers/results.sh         # application results (success, error)

function main() {
    welcome                                 # display the welcome message; source: helpers/app.sh
    execute                                 # execute the primary entry point for this application
}

main