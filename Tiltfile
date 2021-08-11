
os.putenv('WORKSHOP', '1')

load_dynamic('workshop.tiltfile')

local_resource('my-app',
               cmd='echo updating...',
               serve_cmd='./sample-app.sh',
               deps=['./sample-app.sh'],
               readiness_probe=probe(
                   period_secs=5,
                   http_get=http_get_action(port=8765, path="/sample-app.sh")
               ))

local_resource('tutorial-generator',
               cmd='python3 ./tutorial-generator/gen.py ./sample-tutorial',
               deps=['./sample-tutorial'])
