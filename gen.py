#!/usr/bin/env python3

tiltfile_name = 'workshop.Tiltfile'
cmd_file_name = 'workshop.sh'
resource_name = 'workshop'

tiltfile = open(tiltfile_name, 'w')

header = '''
load('ext://workflow', 'workflow')

local_resource('{}', cmd=['echo', 'Tiltfile workshop'])

'''.format(resource_name)

tiltfile.write(header)

cmds = []

with open(cmd_file_name, 'r') as cmd_file:
    for line in cmd_file:
        quoted_args = ["{}".format(arg) for arg in line.split()] # maybe eventually shlex.quote()
        cmds.append(quoted_args)

tiltfile.write('''
workflow('workshop', 
          resource_name='{}',
          work_cmds={},
          clear_cmd={},
    )
'''.format(resource_name, cmds, []))

tiltfile.close()

