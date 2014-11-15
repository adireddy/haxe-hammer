/**
 * Created by Adi Mora on 15/11/2014.
 */

module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        zip: {
            "hammer.zip": ["hammer/**", "haxelib.json"]
        }
    });

    grunt.loadNpmTasks("grunt-zip");
    grunt.registerTask("default", ["zip"]);
};