module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          "tmp/compiled/application.js": ["app/**/*.coffee", "!app/assets/stylesheets/**/*.scss"]

    sass:
      compile:
        files:
          'build/application.css': ["app/assets/stylesheets/**/*.scss"]

    neuter:
      application:
        files:
          'build/application.js': [
            "lib/jquery/jquery.js",
            "lib/bootstrap/bootstrap.js",
            "lib/ember/handlebars.js",
            "lib/ember/ember.js",
            'tmp/compiled/templates.js',
            'tmp/compiled/application.js'
          ],

    ember_templates:
      compile:
        options:
          templateName: (sourceFile) ->
            sourceFile.replace(/app\/templates\//, '')
        files: 'tmp/compiled/templates.js': ["app/templates/*.hbs"]

    watch:
      application_code:
        files: [
          'components/ember/ember.js',
          "app/**/*.coffee",
        ]
        tasks: ["coffee", 'neuter']

      ember_templates:
        files: ["app/templates/*.hbs"]
        tasks: ["ember_templates", "neuter"]

      stylesheets:
        files: ['app/assets/stylesheets/**/*.scss']
        tasks: ['sass', 'neuter']

  grunt.loadNpmTasks('grunt-neuter')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-ember-templates')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-sass')

  grunt.registerTask 'default',
    ["coffee", "sass", "ember_templates", 'neuter', 'watch']
