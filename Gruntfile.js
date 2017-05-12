/**
 * Created by Adi Mora on 11/05/2017.
 */
module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON("package.json"),

        haxe: {
            project: {
                hxml: "build.hxml"
            }
        },

        zip: {
            "hammer.zip": ["src/**", "libs/**", "haxelib.json", "README.md"]
        },

        exec: {
            copy_libs: "cp -R ./libs ../adireddy.github.io/demos/haxe-hammer/",
            copy_js: "cp -R ./js ../adireddy.github.io/demos/haxe-hammer/",
            copy_html: "cp index.html ../adireddy.github.io/demos/haxe-hammer/"
        }
    });

    grunt.loadNpmTasks("grunt-haxe");
    grunt.loadNpmTasks("grunt-zip");
    grunt.loadNpmTasks("grunt-exec");
    grunt.loadNpmTasks("grunt-contrib-copy");
    grunt.registerTask("default", ["haxe", "exec"]);
};