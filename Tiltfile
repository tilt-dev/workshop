
load_dynamic('workshop.tiltfile')

local_resource('dummy',
               cmd='echo updating...',
               serve_cmd='./sample-tutorial/app.sh',
               deps=['./sample-tutorial/app.sh'],
               readiness_probe=probe(
                   period_secs=5,
                   http_get=http_get_action(port=8765, path="/ready.txt")
               ))

# trigger_mode(TRIGGER_MODE_MANUAL)
