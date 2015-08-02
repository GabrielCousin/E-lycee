var gulp          = require('gulp');
var browserSync   = require('browser-sync');
var plumber       = require('gulp-plumber');
var rename        = require('gulp-rename');
var sass          = require('gulp-sass');
var autoprefixer  = require('gulp-autoprefixer');
var minifyCSS     = require('gulp-minify-css');
var minifyJS      = require('gulp-uglify');
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
  return gulp.src('web/dev/scss/*.scss')
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
    .pipe(gulp.dest('web/css'));
});

gulp.task('js', function() {
  return gulp.src([
    'web/dev/js/material.js',
    'web/dev/js/better-dom.js',
    'web/dev/js/better-i18n.js',
    'web/dev/js/better-dateinput-polyfill.js',
    'web/dev/js/card-toogle.js',
    'web/dev/js/fiche-create.js',
    'web/dev/js/fiche-update.js',
    'web/dev/js/graph.js',
    'web/dev/js/multiple-actions.js',
    'web/dev/js/notification.js',
    'web/dev/js/publish-status.js',
    'web/dev/js/signin.js',
  ])
    .pipe(concat('scripts.js'))
    .pipe(minifyJS())
    .pipe(gulp.dest('web/js'));
});


// Dev
gulp.task('css:home', function() {
  return gulp.src('web/dev/scss/app-home.scss')
		.pipe(plumber(function(error) {
				gutil.log(gutil.colors.red(error.message));
				this.emit('end');
		}))
		.pipe(sass())
    .pipe(autoprefixer({
      browsers: ['last 2 versions']
    }))
    .pipe(gulp.dest('web/css'))
    .pipe(browserSync.stream());
});

gulp.task('css:watch_home', function() {
	return gulp.watch(['web/dev/scss/**/*.scss'], ['css:home', 'bs:reload']);
});

gulp.task('css:dashboard', function() {
  return gulp.src('web/dev/scss/app-dashboard.scss')
		.pipe(plumber(function(error) {
				gutil.log(gutil.colors.red(error.message));
				this.emit('end');
		}))
		.pipe(sass())
    .pipe(autoprefixer({
      browsers: ['last 2 versions']
    }))
    .pipe(gulp.dest('web/css'))
    .pipe(browserSync.stream());
});

gulp.task('css:watch_dashboard', function() {
	return gulp.watch(['web/dev/scss/**/*.scss'], ['css:dashboard', 'bs:reload']);
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
gulp.task('home', ['css:home', 'css:watch_home', 'bs:serve']);
gulp.task('dashboard', ['css:dashboard', 'css:watch_dashboard', 'bs:serve']);
