module.exports = (grunt) ->
	# DEPS
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-browserify'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	sourcefiles = ['src/*.coffee', 'src/**/*.coffee']

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json'),
		coffee:
			'main.js': sourcefiles
		browserify:
			  dist: 
			    files: 
			      'main.bundled.js': sourcefiles,
			    options: 
			      transform: ['coffeeify']
			     	browserifyOptions:
			      	builtins:  []
			      	detectGlobals: false
		watch: 
		  coffee: 
		    files: sourcefiles,
		    tasks: 'coffee'

 	
	grunt.registerTask('default', ['coffee']);
	grunt.registerTask('bundle', ['browserify']);