var gulp          = require('gulp');
var browserSync   = require('browser-sync');
var plumber       = require('gulp-plumber');
var rename        = require('gulp-rename');
var sass          = require('gulp-sass');
var autoprefixer  = require('gulp-autoprefixer');
var minifyCSS     = require('gulp-minify-css');
var concat        = require('gulp-concat');
var gutil         = require('gulp-util');


gulp.task('bs', ['css:dev'], function() {
  browserSync.init({
      host: "172.0.0.1:8000",
      ghostMode: false,
      ui: false
  });
});



// Build
gulp.task('css:build', function(){
  return gulp.src('web/dev/scss/app.scss')
    .pipe(plumber())
    .pipe(sass({
      errLogToConsole: true
    }))
    .pipe(autoprefixer({
      browsers: ['last 2 versions']
    }))
    .pipe(minifyCSS({
        aggressiveMerging: false,
        keepSpecialComments: 0
    }))
    .pipe(rename('style.css'))
    .pipe(gulp.dest('web/css'));
});

gulp.task('js', function() {
  return gulp.src(['web/dev/vendors/jquery/dist/jquery.js', 'web/dev/vendors/materialize/dist/js/materialize.js'])
    .pipe(concat('scripts.js'))
    .pipe(gulp.dest('web/js'));
});


// Dev
gulp.task('css:dev', function() {
  return gulp.src('web/dev/scss/app.scss')
		.pipe(plumber(function(error) {
				gutil.log(gutil.colors.red(error.message));
				this.emit('end');
		}))
		.pipe(sass())
    .pipe(autoprefixer({
      browsers: ['last 2 versions']
    }))
    .pipe(rename('style.css'))
    .pipe(gulp.dest('web/css'))
    .pipe(browserSync.stream());
});

gulp.task('css:watch', function() {
	return gulp.watch(['web/dev/scss/**/*.scss'], ['css:dev', 'bs:reload']);
});

gulp.task('bs:serve', function () {
	browserSync.init({
      host: "172.0.0.1:8000",
      ghostMode: false,
      ui: false
  });
});

gulp.task('bs:reload', function () {
	return browserSync.reload({
		stream: true
	});
});


// Tasks
gulp.task('default', ['css:build', 'js']);
gulp.task('dev', ['css:dev', 'css:watch', 'bs:serve']);
