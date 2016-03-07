gulp			= require 'gulp'
jade			= require 'gulp-jade'
coffee			= require 'gulp-coffee'
stylus			= require 'gulp-stylus'
gulpif			= require 'gulp-if'

ASSETS			= 'src/assets/**/*'
SCRIPTS			= 'src/scripts/**/*.coffee'
STYLES			= 'src/styles/**/*.styl'
VIEWS			= 'src/views/**/*.jade'
LIB				= 'lib/**/*'

DIST			= 'dist/'

isIndex = (file)->
	return true if file.path.indexOf('/src/views/index.html') > 0
	false

gulp.task 'assets', ->
	gulp.src ASSETS
		.pipe gulp.dest DIST + '/assets'

gulp.task 'views', ->
	gulp.src VIEWS
		.pipe jade()
		.pipe gulpif(isIndex, gulp.dest DIST)

gulp.task 'scripts', ->
	gulp.src SCRIPTS
		.pipe coffee()
		.pipe gulp.dest DIST + '/scripts'

gulp.task 'styles', ->
	gulp.src STYLES
		.pipe stylus()
		.pipe gulp.dest DIST + '/styles'

gulp.task 'lib', ->
	gulp.src LIB
		.pipe gulp.dest DIST + '/lib'

gulp.task 'watch', ->
	gulp.watch ASSETS, ['assets']
	gulp.watch VIEWS, ['views']
	gulp.watch SCRIPTS, ['scripts']
	gulp.watch STYLES, ['styles']
	gulp.watch LIB, ['lib']


gulp.task 'default', ['assets', 'views', 'scripts', 'styles', 'lib']