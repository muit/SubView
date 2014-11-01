"use strict"

// -- DEPENDENCIES -------------------------------------------------------------
var gulp    = require('gulp');
var coffee  = require('gulp-coffee');
var concat  = require('gulp-concat');
var connect = require('gulp-connect');
var header  = require('gulp-header');
var uglify  = require('gulp-uglify');
var gutil   = require('gulp-util');
var stylus  = require('gulp-stylus');
var yml     = require('gulp-yml');
var pkg     = require('./package.json');
var ServeMe = require('serve-me')({directory: './www', debug: true });
if(typeof Utyl == "undefined")
  require("./source/utyl/utyl.js");

// -- FILES --------------------------------------------------------------------
var assets = './www/assets';
var libs = './lib';

var bower = {
  js : ['lib/hope/hope.js',
        'lib/atoms/atoms.js',
        'lib/atoms/atoms.app.js',
        'lib/appnima/*.js',
        'lib/atoms-app-*/*.js'],
  css: [
        'lib/atoms/atoms.app.css',
        'lib/atoms-icons/atoms.icons.css',
        'lib/atoms-app-*/*.css']};

var source = {
  sv_coffee: [ 'source/server/*.coffee',
               'source/server/controller/*.coffee',
               'source/server/model/*.coffee'],
  coffee   : [ 'source/app/entities/*.coffee',
               'source/app/atoms/*.coffee',
               'source/app/molecules/*.coffee',
               'source/app/organisms/*.coffee',
               'source/app/*.coffee',
               'source/app/*.*.coffee'],
  styl     : [ 'source/app/style/__init.styl',
               'source/app/style/__vendor.styl',
               'source/app/style/atom.*.styl',
               'source/app/style/molecule.*.styl',
               'source/app/style/organism.*.styl',
               'source/app/style/app.styl',
               'source/app/style/app.*.styl'],
  yml      : [ 'source/app/organisms/*.yml']};

var banner = ['/**',
  ' * <%= pkg.name %> - <%= pkg.description %>',
  ' * @version v<%= pkg.version %>',
  ' * @link    <%= pkg.homepage %>',
  ' * @author  <%= pkg.author.name %> (<%= pkg.author.site %>)',
  ' * @license <%= pkg.license %>',
  ' */',
  ''].join('\n');

// -- TASKS --------------------------------------------------------------------
gulp.task('bower', function()
{
  gulp.src(bower.js)
    .pipe(concat('atoms.js'))
    .pipe(gulp.dest(assets + '/js'));

  gulp.src(bower.css)
    .pipe(concat('atoms.css'))
    .pipe(gulp.dest(assets + '/css'));
});

gulp.task('coffee', function()
{
  gulp.src(source.coffee)
    .pipe(concat('atoms.' + pkg.name + '.coffee'))
    .pipe(coffee().on('error', gutil.log))
    .pipe(uglify({mangle: false}))
    .pipe(header(banner, {pkg: pkg}))
    .pipe(gulp.dest(assets + '/js'))
    .pipe(connect.reload());
});

gulp.task('server_coffee', function()
{
  gulp.src(source.sv_coffee)
    .pipe(concat('server.' + pkg.name + '.coffee'))
    .pipe(coffee().on('error', gutil.log))
    .pipe(uglify({mangle: false}))
    .pipe(header(banner, {pkg: pkg}))
    .pipe(gulp.dest(libs))
    .pipe(connect.reload());
});

gulp.task('styl', function()
{
  gulp.src(source.styl)
    .pipe(concat('atoms.' + pkg.name + '.styl'))
    .pipe(stylus({compress: true, errors: true}))
    .pipe(header(banner, {pkg: pkg}))
    .pipe(gulp.dest(assets + '/css'))
    .pipe(connect.reload());
});

gulp.task('yml', function()
{
  console.log(source.yml);
  gulp.src(source.yml)
    .pipe(yml().on('error', gutil.log))
    .pipe(gulp.dest(assets + '/scaffold'))
    .pipe(connect.reload());
});

gulp.task('webserver', function()
{
  gulp.run(['server_coffee']);
  require('./lib/server.' + pkg.name + '.js');

  ServeMe.start(8080);
});

gulp.task('init', function()
{
  gulp.run(['bower', 'coffee', 'styl', 'yml']);
});

gulp.task('default', function()
{
  gulp.run(['webserver']);
  gulp.watch(source.coffee, ['coffee']);
  gulp.watch(source.styl, ['styl']);
  gulp.watch(source.yml, ['yml']);
});
