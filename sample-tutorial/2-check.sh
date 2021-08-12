NAME="my-app"
KIND="uiresource"
# change to .status.updateStatus for build/update
API_PATH=".status.runtimeStatus"
VALUE="ok"

/usr/bin/env bash "${TILT_WORKSHOP_TMPDIR}/api-check.sh" "${KIND}" "${NAME}" "${API_PATH}" "${VALUE}"
