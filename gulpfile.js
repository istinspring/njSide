(function () {
    'use strict';
    var gulp = require('gulp');
        // del = require('del'),
        // shell = require('gulp-shell'),

    var less = require('gulp-less');
    var sourcemaps = require('gulp-sourcemaps');
    var ngAnnotate = require('gulp-ng-annotate');
    var uglify = require('gulp-uglify');
    var concat = require('gulp-concat');
    var minifyCSS = require('gulp-minify-css');

        // var usemin = require('gulp-usemin');
        // var minifyHtml = require('gulp-minify-html');
        // var minifyCss = require('gulp-minify-css');
        // var rev = require('gulp-rev');
        // var inject = require('gulp-inject');
        // var combinedStream = require('combined-stream');
        // var angularFilesort = require('gulp-angular-filesort');
        // var rename = require('gulp-rename');

    var vendorsJS = [
            './themes/njside/source/_vendors/jquery/dist/jquery.js',
            './themes/njside/source/_vendors/angular/angular.js',
            './themes/njside/source/_vendors/angular-aria/angular-aria.js',
            './themes/njside/source/_vendors/angular-resource/angular-resource.min.js',
            './themes/njside/source/_vendors/bootstrap-material-design/scripts/material.js',
        ];
    var vendorsCSS = [
            './themes/njside/source/_vendors/angular-loading-bar/build/loading-bar.css',
            './themes/njside/source/_vendors/bootstrap-material-design/dist/css/material.css'
        ];

    var appJS = [];
    var appLESS = ['/themes/njside/source/_less/main.less'];

    gulp.task('compile-less', function() {
        return gulp
                .src(appLESS)
                .pipe(sourcemaps.init())
                .pipe(less({compress: true}))
                .pipe(concat('app.min.css'))
                .pipe(sourcemaps.write())
                .pipe(gulp.dest('./themes/njside/source/assets/css'));
    });

    gulp.task('vendors-css', function() {
        return gulp
                .src(vendorsCSS)
                .pipe(sourcemaps.init())
                .pipe(minifyCSS({keepBreaks:true}))
                .pipe(concat('vendors.min.css'))
                .pipe(sourcemaps.write())
                .pipe(gulp.dest('./themes/njside/source/assets'));
    });

    gulp.task('vendors-js', function() {
        return gulp
                .src(vendorsJS)
                .pipe(ngAnnotate())
                .pipe(sourcemaps.init())
                .pipe(uglify())
                .pipe(concat('vendors.min.js'))
                .pipe(sourcemaps.write())
                .pipe(gulp.dest('./themes/njside/source/assets/js'));
    });

    function notifyLiveReloadClient(event) {
        // Notify front end about file changes,
        // front-end should reload the page
        var fileName = path.relative('themes/njside', event.path);
        liveReload.changed({body: {files: ['themes/njside/' + fileName]}});
    }

    gulp.task('watch', function () {
        // Watch on client-side files
        gulp.watch('./themes/njside/layout/*.swig', notifyLiveReloadClient);
        gulp.watch('./themes/njside/layout/_partials/*.html', notifyLiveReloadClient);
        gulp.watch('./themes/njside/source/assets/css/*.css', notifyLiveReloadClient);
        // less compiller
        gulp.watch('./themes/njside/source/_less/*.less', ['compile-less']);
        gulp.watch('./themes/njside/source/_less/**/*.less', ['compile-less']);
        // js
        gulp.watch('./themes/njside/source/_js/*.js', ['js-pipeline']);
        gulp.watch('./themes/njside/source/_js/**/*.js', ['js-pipeline']);
    });

    // gulp.task('copyJS', function () {
    //     return gulp.src(vendorsJS).pipe(gulp.dest('themes/njside/source/assets'));
    // });
    //
    gulp.task('copyVendorsCSS', function () {
        return gulp.src(vendorsCSS).pipe(gulp.dest('./themes/njside/source/assets/css'));
    });

    // gulp.task('usemin', ['less', 'inject'], function() {
    //     return gulp.src(allUsefulHtml)
    //         .pipe(usemin({
    //         css: [minifyCss(), 'concat', rev()],
    //         html: [minifyHtml({empty: true})],
    //         js: [ngAnnotate(), rev()]
    //         }))
    //         .pipe(gulp.dest('dist/'));
    // });

    // gulp.task('copy', ['copy-images', 'copy-fonts']);

    gulp.task('clean', function() {
        del([
            'frontend/build/**',
            'dist/**'
        ]);
    });

    gulp.task('debug_server', ['compile-less', 'vendors-css', 'vendors-js'], function () {
        require('hexo').init({command: 'server', debug: true});
    });

    gulp.task('server', ['compile-less', 'copyVendorsCSS', 'vendors-js'], function () {
        require('hexo').init({command: 'server'});
    });

    gulp.task('default', ['watch', 'server']);

    // gulp.task('build', ['lint', 'usemin', 'copy']);
}());
