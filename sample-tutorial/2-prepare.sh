sed -i '' -e 's/http/hzzp/' ./sample-app.sh

# wait for the resource to be in the 'error' state before moving on...

NAME="my-app"
KIND="uiresource"
# change to .status.updateStatus for build/update
API_PATH=".status.runtimeStatus"
VALUE="error"

/usr/bin/env bash "${TILT_WORKSHOP_TMPDIR}/api-check.sh" "${KIND}" "${NAME}" "${API_PATH}" "${VALUE}" >/dev/null
