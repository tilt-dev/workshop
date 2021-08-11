echo "Preparing the next step...hang tight!"

sed -i '' -e 's/http/hzzp/' ./sample-tutorial/app.sh

/usr/bin/env bash "${TILT_WORKSHOP_TMPDIR}/api-check.sh" "uiresource" "dummy" ".status.runtimeStatus" "error" >/dev/null
