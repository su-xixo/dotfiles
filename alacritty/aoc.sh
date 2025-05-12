#!/bin/bash
# FILE="${HOME}/dotfiles/alacritty/alacritty.toml"
FILE="${HOME}/.config/alacritty/alacritty.toml"

SED_REGEX="^(window\.)?(opacity\s*=\s*)[0-9]\.[0-9]"
GREP_REGEX="^(window\.)?(opacity\s*=\s*)[0-9]\.[0-9]"

function writeOPCTY (){
  sed -Ei "s/${SED_REGEX}/\1\2${1}/" ${FILE}
  # bat ${FILE}
}

if test -f ${FILE}; then
  OPCTY_LINE=$(grep -Eix "${GREP_REGEX}" ${FILE} | tail -1) # get last opacity line
  if [ -n "${OPCTY_LINE}" ]; then
    OPCTY=$(echo "${OPCTY_LINE}" | grep -Eo "[0-9]\.[0-9]") # get opacity value
    if [ "${OPCTY}" = "0.4" ]; then
      writeOPCTY 1.0
    else
      writeOPCTY 0.4
    fi
  fi
fi
