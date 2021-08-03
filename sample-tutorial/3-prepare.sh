button=$(cat << EOF
apiVersion: tilt.dev/v1alpha1
kind: UIButton
metadata:
  annotations:
    tilt.dev/resource: workshop
  name: workshop-example-button
spec:
  iconName: pets
  location:
    componentID: workshop
    componentType: Resource
  text: Click me!
EOF
)

echo "${button}" | tilt apply -f -
