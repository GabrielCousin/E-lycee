var gulp          = require('gulp');
var plumber       = require('gulp-plumber');
var rename        = require('gulp-rename');
var sass          = require('gulp-sass');
var autoprefixer  = require('gulp-autoprefixer');
var minifyCSS     = require('gulp-minify-css');

// Build
gulp.task('build', function(){
  return gulp.src('web/dev/scss/app.scss')
    .pipe(plumber())
    .pipe(sass().on('error', sass.logError))
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

// Dev
gulp.task('css:dev', function(){
  return gulp.src('web/dev/scss/app.scss')
    .pipe(plumber())
    .pipe(sass().on('error', sass.logError))
    .pipe(autoprefixer({
      browsers: ['last 2 versions']
    }))
    .pipe(rename('style.css'))
    .pipe(gulp.dest('web/css'));
});

// Tasks
gulp.task('default', ['build']);
gulp.task('dev', ['css:dev'], function(){
  gulp.watch(["web/dev/scss/**/*.scss"], ['css:dev'])
});
