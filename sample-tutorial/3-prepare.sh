RESOURCE="my-app"

button=$(cat << EOF
apiVersion: tilt.dev/v1alpha1
kind: UIButton
metadata:
  annotations:
    tilt.dev/resource: ${RESOURCE}
  name: workshop-example-button
spec:
  iconName: pets
  location:
    componentID: ${RESOURCE}
    componentType: Resource
  text: Click me!
EOF
)

TILT_BIN="${TILT_BIN:-tilt}"

echo "${button}" | "${TILT_BIN}" apply -f -
