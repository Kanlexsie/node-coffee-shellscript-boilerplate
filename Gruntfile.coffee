module.exports = (grunt) ->
	# DEPS
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-browserify'
	grunt.loadNpmTasks('grunt-contrib-watch');

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json'),
		coffee:
			'main.js': ['*.coffee']

		watch: 
		  coffee: 
		    files: ['*.coffee'],
		    tasks: 'coffee'

 	
	grunt.registerTask('default', ['coffee']);