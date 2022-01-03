#!/bin/bash

function success() {
    printf "%s\n\n" "${GREEN}${BOLD}Congratulations!${NORMAL}  Your dev org is ready to be used."
}

function failure() {
    printf "%s\n\n" "${RED}Oops!  Something went wrong.${NORMAL}"
}

function confused() {
    printf "\n%s\n\n" "${MAGENTA}I'm not sure what to do next.${NORMAL}  Ending the process without a successful result."
}