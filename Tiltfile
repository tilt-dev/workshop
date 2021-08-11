
os.putenv('WORKSHOP', '1')

load_dynamic('workshop.tiltfile')

local_resource('dummy',
               cmd='echo updating...',
               serve_cmd='./sample-tutorial/app.sh',
               deps=['./sample-tutorial/app.sh'],
               readiness_probe=probe(
                   period_secs=5,
                   http_get=http_get_action(port=8765, path="/ready.txt")
               ))

local_resource('tutorial-generator',
               cmd='python3 ./tutorial-generator/gen.py ./sample-tutorial',
               deps=['./sample-tutorial'])
