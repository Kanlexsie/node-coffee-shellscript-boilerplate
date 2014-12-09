### include libs which make scripting way easier ###
require 'shelljs/global'         # see https://github.com/arturadib/shelljs
inquirer  = require "inquirer"   # see https://github.com/SBoudrias/Inquirer.js
commander = require "commander"  # see https://github.com/tj/commander.js
fs        = require "fs"

### Initialisation Boilerplate #####################

# silence shelljs output
config.silent = true;

# die on shelljs errors
config.fatal = true;

### command line processing ########################

commander
	.version "0.0.1"
	#.option "-p, --peppers", "Add peppers"
	#.option "-P, --pineapple", "Add pineapple"
	#.option "-b, --bbq", "Add bbq sauce"
	#.option "-c, --cheese [type]", "Add the specified type of cheese [marble]", "marble"

	# provide a command which inline function	
	#.command "rmdir <dir> [otherDirs...]"
	#.action (dir, otherDirs) ->
	#  console.log "rmdir %s", dir
	#  if otherDirs
	#    otherDirs.forEach (oDir) ->
	#      console.log "rmdir %s", oDir

	.parse process.argv


### your code below ################################

