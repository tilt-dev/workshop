NAME="workshop-example-button"
KIND="uibutton"
API_PATH=".status.lastClickedAt"
# after_now does a datetime comparison to ensure the field is after now()
VALUE="after_now"

/usr/bin/env bash "${TILT_WORKSHOP_TMPDIR}/api-check.sh" "${KIND}" "${NAME}" "${API_PATH}" "${VALUE}"
