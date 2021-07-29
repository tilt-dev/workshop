
load('ext://workflow', 'workflow')

local_resource('workshop', cmd=['echo', 'Tiltfile workshop'])


workflow('workshop', 
          resource_name='workshop',
          work_cmds=[['echo', 'hi'], ['echo', 'hello'], ['echo', 'third'], ['echo', 'fourth'], ['echo', 'ok', 'bye', 'now']],
          clear_cmd=[],
    )
