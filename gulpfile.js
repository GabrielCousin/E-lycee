var gulp          = require('gulp');
var browserSync   = require('browser-sync');
var plumber       = require('gulp-plumber');
var rename        = require('gulp-rename');
var sass          = require('gulp-sass');
var autoprefixer  = require('gulp-autoprefixer');
var minifyCSS     = require('gulp-minify-css');

gulp.task('bs', ['css:dev'], function() {
  browserSync.init({
      host: "localhost:8000",
      ghostMode: false,
      ui: false
  });
});

// Build
gulp.task('css:build', function(){
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
    .pipe(gulp.dest('web/css'))
    .pipe(browserSync.stream());
});

// Tasks
gulp.task('default', ['css:build']);
gulp.task('dev', ['css:dev', 'bs'], function(){
  gulp.watch(["web/dev/scss/**/*.scss"], ['css:dev'])
});
