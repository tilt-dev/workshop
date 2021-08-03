#!/usr/bin/env bash

# set -x

KIND="${1}"
NAME="${2}"
API_PATH="${3}"
EXPECTED="${4}"

TILT_BIN="${TILT_BIN:-tilt}"

# portable ISO8601 for macOS + Linux (no fractional seconds is fine for our purposes)
now=$(date -u +"%Y-%m-%dT%H:%M:%S.000000Z")

printf "Waiting for '%s' to be updated...\n\n" "${NAME}"

lastValue=""
while IFS= read -r -d~ value;
do
  if [[ ${EXPECTED} == "after_now" ]]; then
    if [[ ${value} > "${now}" ]]; then
      break
    fi
  else
    if [[ ${value} == "${EXPECTED}" ]]; then
        break
    elif [[ ${value} != "${lastValue}" ]]; then
        echo "Current ${API_PATH}: ${value} (desired: ${EXPECTED})"
        lastValue="${value}"
    fi
  fi
done < <("${TILT_BIN}" get --watch "${KIND}" "${NAME}" -o=jsonpath="{${API_PATH}}{\"~\"}")

printf "\nYou did it! Click Tutorial: Next Step to move on.\n"
