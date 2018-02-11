from fabric.api import *

env.hosts = [

	'fa@10.0.0.100',
	'fa@10.0.0.101',

]

env.password = 'fa'

@parallel
def cmd(command):
	sudo(command)