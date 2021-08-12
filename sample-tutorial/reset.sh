# if any of the prepare scripts modify the environment, this is the place to undo them :)

TILT_BIN="${TILT_BIN:-tilt}"

sed -i '' -e 's/hzzp/http/' ./sample-app.sh

"${TILT_BIN}" delete --ignore-not-found uibutton "workshop-example-button"
